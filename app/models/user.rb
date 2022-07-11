class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :buyers

         validates :email, uniqueness: true



         validates :name, presence: true
         validates :first_name, presence: true
         validates :first_name_huri, presence: true
         validates :family_name, presence: true
         validates :family_name_huri, presence: true
         validates :birthday, presence: true

        validates :family_name_huri, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}
        validates :first_name_huri, format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/}

        validates :password, format: { with:/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}






end
