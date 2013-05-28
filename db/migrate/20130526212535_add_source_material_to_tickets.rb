class AddSourceMaterialToCharacters < ActiveRecord::Migration
  def change
    add_column :characters, :source_material_id, :integer
    add_index :characters, :source_material_id
  end
end
