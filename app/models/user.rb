class User < ApplicationRecord
  before_validation { email.downcase! }
  validates :name, presence: true, length: { in: 1..20 }
  validates :email, presence: true, length: { in: 1..50 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  with_options on: :new_case do
    validates :email, uniqueness: true
    validates :password, presence: true
    validates :password, length: { minimum: 6 }
  end
  with_options on: :edit_case do
    with_options unless: proc { |s| s.password.blank? } do
      validates :password, length: { minimum: 6 }
    end
  end
  has_many :pictures
end
