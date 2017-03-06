class CreateHashtags < ActiveRecord::Migration
  def up
    create_table :hashtags do |t|
      t.string :name, :limit => 50,  :default => '', :null => false
      t.string :relation, :limit => 25, :default => '', :null => false
      t.string :description, :default => '', :limit =>140
      t.timestamps
    end
    #creating a relationship manager between hashtags and post
    create_table :hashtags_posts do |t| 
      #t.integer :hashtags_id , :null => false
      #t.integer :posts_id, :null => false
      t.belongs_to :hashtag, index:true
      t.belongs_to :post, index:true
  	end
  	#add_index(:hashtags_posts, :hashtags_id)
  	#add_index(:hashtags_posts, :posts_id)
  end

  def down
  	drop_table :hashtags
  	drop_table :hashtags_posts
  end
end