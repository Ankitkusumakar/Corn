class User < ApplicationRecord
            # Include default devise modules.
        #     devise :database_authenticatable, :registerable,
        #             :recoverable, :rememberable, :trackable, :validatable,
        #             :confirmable, :omniauthable
            include DeviseTokenAuth::Concerns::User
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
