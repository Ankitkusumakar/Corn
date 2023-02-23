class Post < ApplicationRecord
    # include ImageUploader::Attachment(:image)
    belongs_to :user
    belongs_to :category, dependent: :delete
    has_many :likes, dependent: :destroy
    validates :title, :presence=> true
    validates :description, :presence=> true
    has_one_attached :image
end
