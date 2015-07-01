class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :title, :null => false
      t.string :body, :null => false
      t.integer :user_id
      t.timestamp null: false
    end
  end
end
