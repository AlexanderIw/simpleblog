class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  #associations
  belongs_to :user,  counter_cache:true    #class_name: user, foreign_key: user_id
  has_and_belongs_to_many :hashtags

  def should_generate_new_friendly_id?
      title_changed?
  end
end
