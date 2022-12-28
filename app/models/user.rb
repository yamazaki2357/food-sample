# frozen_string_literal: true

# login_management
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,100}+\z/i,
                                 message: 'には半角英数字をそれぞれ一種類以上含めてください' }
  has_many :cookings

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end
