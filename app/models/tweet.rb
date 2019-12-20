class Tweet < ApplicationRecord
  has_many :images
  accepts_nested_attributes_for :images

  #バリデーション記述
  validates_associated :images

  validates :content, presence: true

  validates :images, presence: true
end
