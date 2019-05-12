class RenamePasswordDijestColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :password_dijest, :password_digest
  end
end
