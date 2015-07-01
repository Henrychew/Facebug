class CreateUsers < ActiveRecord::Migration
  def change
     create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, unique: true
      t.string :password
      t.string :gender
      t.timestamps null: false
    end
  end
end
