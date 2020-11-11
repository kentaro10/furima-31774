class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :nickname,         presence: true
         validates :first_name,       presence: true
         validates :second_name,      presence: true
         validates :first_name_kana,  presence: true
         validates :second_name_kana, presence: true
         validates :birthday,         presence: true
         validates :password,         format: { with:  /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i, message: "は半角6文字以上の英数字それぞれ一文字以上含む必要があります"}

end
