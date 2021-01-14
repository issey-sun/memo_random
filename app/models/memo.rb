class Memo < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true
end

