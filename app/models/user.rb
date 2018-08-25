class User < ApplicationRecord
  before_save { self.email.downcase! } #すべて小文字にして保存
  validates :name, presence: true, length: { maximum: 50 } #カラを許さず。長さ50文字以内
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false } #カラを許さず、長さ255文字以内、正規表現で重複を許さない(大文字と小文字は区別しない)
  has_secure_password

  has_many :tasks
end
