class PreviewGeneratorWorker
  include Sidekiq::Worker

  def perform(params)
    map = Map.find(params["map_id"])
    preview = map.preview
    map.file.open do | file |
      previewpath = File.join(File.dirname(file.path),
                              File.basename(file.path, '.*') + ".png")
      puts "        PATH      #{previewpath}       "
      if system "preview-generate.py #{file.path}"
        preview.image.attach(io: File.open(previewpath),
                             filename: File.basename(previewpath))
        preview.image.attached? ? preview.done! : preview.error!

        #File.delete(previewpath)
      else
        preview.error!
      end
    end
  end
end
