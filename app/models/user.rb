# frozen_string_literal: true

class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { player: 0, admin: 1 }
  enum preferred_hand: { right: 0, left: 1 }

  enum gender: { male: 0, female: 1, other: 2 }

  validates :nickname, presence: true, uniqueness: true
  validates :uid, presence: true
  validates :email, presence: true,
            format: { with: EMAIL_REGEX, message: "is not a valid email" },
            uniqueness: { case_sensitive: false, scope: :provider }
  validates :preferred_hand, presence: true
  validates :gender, presence: true
end
