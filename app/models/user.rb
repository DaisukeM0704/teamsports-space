class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :birthplace
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:member_id]
  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :birthplace_id
    validates :member_id
  end
  
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :first_name
    validates :last_name
  end
  
  with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birthplace_id, numericality: { other_than: 1 } 
  
  validates_uniqueness_of :member_id

  #usernameを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["username = :value", { :value => username }]).first
    else
      where(conditions).first
    end
  end

  #登録時にemailを不要とする
  def email_required?
    false
  end

  def email_changed?
    false
  end
end
