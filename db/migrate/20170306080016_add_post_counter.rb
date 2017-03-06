class AddPostCounter < ActiveRecord::Migration
  def change
    #modelName.underscore.pluralize_count
    add_column :users, :posts_count, :integer, limit: 4, default: 0, null: false
    User.all.each do |user|
      current_count = user.posts.length
      puts user.posts.length
      user.update_attribute(:posts_count, current_count)
    end
  end
end
