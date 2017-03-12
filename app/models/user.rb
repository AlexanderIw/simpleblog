class User < ActiveRecord::Base

    has_secure_password #attr_accessor :password, :password_confirmation
    
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    
    #Associations
    has_many :posts

    #Validations
    validates :name,  presence: true, length: {maximum:50}
    validates :email, presence: true, length: {maximum:255}, 
               format: {with:VALID_EMAIL_REGEX},uniqueness: {case_sensitive: false}
    validates :password, presence: true, length:{minimum: 6}
    validates :password_confirmation, presence: true

    before_save do
         self.email = email.downcase
         self.user_level = self.user_level || 1 #maybe put this in the controller
    end


    #def recent_posts
    #    self.posts.find(:all, order: 'created_at ASC', limit: 5)
    #end

    #has_many :recent_posts, class_name:'Post', order: 'created_at ASC', limit:5
end
