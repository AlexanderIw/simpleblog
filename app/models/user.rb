class User < ActiveRecord::Base
    #associations
    has_many :posts

    #def recent_posts
    #    self.posts.find(:all, order: 'created_at ASC', limit: 5)
    #end

    #has_many :recent_posts, class_name:'Post', order: 'created_at ASC', limit:5
end
