class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.integer :user_id
      t.string :user_username
      t.string :slug
      
      t.references :user

      t.timestamps null: false
    end
  end
end
