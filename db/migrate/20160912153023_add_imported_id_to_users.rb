class AddImportedIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :imported_id, :bigint
  end
end
