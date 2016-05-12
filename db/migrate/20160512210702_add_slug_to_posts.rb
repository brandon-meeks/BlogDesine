class AddSlugToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :slugg, :string
  end
end
