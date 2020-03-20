class Topic < ApplicationRecord
  validates :user_id, presence: true
  validates :description, presence: true
  validates :image, presence: true
  #presence: trueは記入欄が空白ではダメ
  belongs_to :user #topicはUserにbelongs_to（所属）
  
  mount_uploader :image, ImageUploader
  
  has_many :favorites #topicは複数のfavoriteモデルを持つ
  has_many :favorite_users, through: :favorites, source: 'user'
end
