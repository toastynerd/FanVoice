class CreateSourceMaterials < ActiveRecord::Migration
  def change
    create_table :source_materials do |t|
      t.string :title
      t.string :genre
      t.string :description

      t.timestamps
    end
  end
end
