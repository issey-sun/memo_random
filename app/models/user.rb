class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :memos, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :active_notifications, foreign_key:"visitor_id", class_name: "Notification", dependent: :destroy
  has_many :passive_notifications, foreign_key:"visited_id", class_name: "Notification", dependent: :destroy

  validates :nickname, presence: true
end
