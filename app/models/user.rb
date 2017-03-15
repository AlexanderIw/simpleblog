class User < ActiveRecord::Base
    attr_accessor :remember_token
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
         self.user_level ||= 1          #maybe put this in the controller
    end

    #for users test
    def self.digest(string)
       cost= ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
       BCrypt::Password.create(string, cost: cost)
    end

    #return a safe token
    def self.new_token
        SecureRandom.urlsafe_base64
    end

    #update user db.remember_token to be encrypted and have a persistent sessions
    def remember_digest_update
        self.remember_token = User.new_token
        update_attribute(:remember_digest, User.digest(remember_token))
    end

    def forget_digest_update
        update_attribute(:remember_digest, nil)
    end
    #return true if the given token matches the digeset else false
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    #def recent_posts
    #    self.posts.find(:all, order: 'created_at ASC', limit: 5)
    #end
    #has_many :recent_posts, class_name:'Post', order: 'created_at ASC', limit:5
end
