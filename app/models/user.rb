class User < ApplicationRecord
  validates :name, presence: true, length: { in: 1..20 }
  validates :email, presence: true, length: { in: 1..50 }, 
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
