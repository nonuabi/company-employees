class CreateDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :developers do |t|
      t.string :first_name
      t.string :last_name
      t.string :profile
      t.string :email
      t.string :phone_number

      t.timestamps
    end
  end
end
