class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.integer :post_id, unique: true
      t.integer :tag_id, unique: true
      t.timestamp null: false
    end
  end
end
