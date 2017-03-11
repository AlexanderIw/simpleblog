class CreatePosts < ActiveRecord::Migration
  def up
    create_table :posts do |t|
      t.belongs_to :user, index:true #foreign key
      t.string :title,    :limit => 100,  :default => '', :null => false
      t.string :subtitle, :limit =>100,   :default => ''
      t.text :content,   :null => false
      t.string :status,   :limit =>25,    :default => '', :null => false
      t.string :link,     :limit => 100,  :default => ''
      t.string :slug
      t.timestamps
    end
    add_index :posts, :slug, unique: true
  end

  def down
  	drop_table :posts
  end
end