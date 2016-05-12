class Post < ActiveRecord::Base
    belongs_to :user, dependent: :destroy
    
    extend FriendlyId
    friendly_id :title, use: :slugged
end
