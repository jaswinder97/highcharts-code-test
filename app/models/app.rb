class App < ApplicationRecord
  belongs_to :user, optional: true
  has_many :stats
  
  validates_url :openid_redirect_urls, message: "- please include http or https in the URL"
  validates_url :client_uri, message: "- please include http or https in the URL"
  validates_url :policy_uri, message: "- please include http or https in the URL"
  validates_url :tos_uri, message: "- please include http or https in the URL"
  validates_url :logo_uri, message: "- please include http or https in the URL"
  validates_format_of :contacts, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: '- please add a valid email address'
  validates :openid_redirect_urls, presence: true
  AUTH_METHODS = ["none", "client_secret_basic", "client_secret_jwt", "client_secret_post", "private_key_jwt"]
  validates_inclusion_of :token_endpoint_auth_method, in: AUTH_METHODS    
  
  # def encode_env(str)
  #   @app.openid_client_secret
  # end
end
