class Team < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :sports_type
  has_one_attached :image
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :authentication_keys => [:team_cord]

  with_options presence: true do
    validates :team_name
    validates :team_cord, format: { with: /\A[a-z0-9]+\z/ }
    validates :team_profile
    validates :sports_type_id
  end
        
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :representative_first_name
    validates :representative_last_name
  end
        
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :representative_first_name_kana
    validates :representative_last_name_kana
  end
  
  validates :email, uniqueness: true
  validates :team_cord, uniqueness: true



  #team_cordを利用してログインするようにオーバーライド
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      #認証の条件式を変更する
      where(conditions).where(["team_cord = :value", { :value => team_cord }]).first
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
