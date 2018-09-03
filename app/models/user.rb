class User < ApplicationRecord
  rolify
  has_many :apps
  has_many :invitations, :class_name => self.to_s, :as => :invited_by
  has_one :subscription
  has_many :account_accesses
  has_many :accounts, :through => :account_accesses
  has_many :stats, :through => :apps

  # Include default devise modules.
  devise :invitable, :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  validates :email, presence: true, uniqueness: true
  validates :openid_access_token, uniqueness: true, allow_blank: true

  # Devise method
  # def active_for_authentication?
  #   super && self.account.present? # i.e. super && self.is_active
  # end

  def inactive_message
    "This account has been deactivated or doesn't have account."
  end

  private 


end
