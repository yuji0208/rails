class Topic < ApplicationRecord
  validates :user_id, presence: true #値を必ず入力する必要あり
  validates :description, presence: true
  validates :image, presence: true
  
  belongs_to :user
  
  mount_uploader :image, ImageUploader
end
