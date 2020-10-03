class Prototype < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  validates :image, presence: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
  
end
