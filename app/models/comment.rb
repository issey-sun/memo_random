class Comment < ApplicationRecord
  belongs_to :prototype
  belongs_to :user
  has_many :notifications, dependent: :destroy

  validates :text, presence: true
end
