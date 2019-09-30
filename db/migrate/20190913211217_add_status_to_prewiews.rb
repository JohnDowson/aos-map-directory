class AddStatusToPrewiews < ActiveRecord::Migration[6.0]
  def change
    add_column :previews, :status, :integer, default: 0
  end
end
