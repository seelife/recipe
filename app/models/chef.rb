class Chef < ApplicationRecord
  has_many :recipes
  has_many :likes

  before_save { self.email = email.downcase }

  validates :chefname, presence: true, length: {minimum: 3, maximum: 40}
  VALID_EMAIL_REGEX = VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 105},
                    uniqueness: {case_sensitive: false}, format: {with: VALID_EMAIL_REGEX}
  #validates :description, presence: true, length: {minimum: 20, maximum: 500}

end
