class Post < ApplicationRecord
    belongs_to :user
    belongs_to :category, dependent: :delete
  
    validates :title, :presence=> true
    validates :description, :presence=> true
end
