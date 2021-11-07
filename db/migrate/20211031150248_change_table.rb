class ChangeTable < ActiveRecord::Migration[5.2]
  def change
    add_column :developers, :github_id, :string
    rename_column :developers, :email, :email_id 
    remove_timestamps :developers
  end
end
