class AddHandleToCharacters < ActiveRecord::Migration
  def change
   add_column :characters, :handle, :string
  end
end
