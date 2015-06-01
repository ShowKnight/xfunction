class CreateUser1s < ActiveRecord::Migration
  def change
    create_table :user1s do |t|
      t.string :username
      t.string :password
      t.string :email
      t.text :description

      t.timestamps null: false
    end
  end
end
