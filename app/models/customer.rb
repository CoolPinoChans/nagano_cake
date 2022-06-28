class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true
  validates :first_name_kana, presence: true
  validates :post_code , presence: true
  validates :address , presence: true
  validates :phone_number , presence: true
  validates :email , presence: true

 has_many :carts, dependent: :destroy
 has_many :deliveries, dependent: :destroy


  def full_name
    self.last_name + ' ' + self.first_name
  end

  def full_name_kana
    self.last_name_kana + ' ' + self.first_name_kana
  end

  def full_address
    '〒' + post_code + ' ' + address + ' ' + full_name
  end

end
