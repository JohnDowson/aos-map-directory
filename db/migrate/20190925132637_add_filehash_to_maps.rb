class AddFilehashToMaps < ActiveRecord::Migration[6.0]
  def change
    add_column :maps, :filehash, :string
  end
end
