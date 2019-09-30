class CreateTaggings < ActiveRecord::Migration[6.0]
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, null: false, foreign_key: true
      t.belongs_to :map, null: false, foreign_key: true

      t.timestamps
    end
    # add_index :taggings, :map_id
    # add_index :taggings, :tag_id
  end
end
