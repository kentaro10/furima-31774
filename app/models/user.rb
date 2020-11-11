class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         with_options presence: true do
         validates :nickname         
         validates :first_name,       format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は、ひらがなかカタカナか漢字である必要があります" }
         validates :second_name,      format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は、ひらがなかカタカナか漢字である必要があります" }
         validates :first_name_kana,  format: { with: /\A[ァ-ヶー－]+\z/, message: "は、カタカナである必要があります" }
         validates :second_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は、カタカナである必要があります" }
         validates :birthday    
         end
         validates :password,         format: { with:  /\A(?=.*?[A-z])(?=.*?[\d])[A-z\d]+\z/i, message: "は半角6文字以上の英数字それぞれ一文字以上含む必要があります"}
         validates :email,            format: { with: /@/, message: "は＠が必要です" }

end
