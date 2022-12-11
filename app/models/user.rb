class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable

  has_many :posts
  belongs_to :group, optional: true
end
