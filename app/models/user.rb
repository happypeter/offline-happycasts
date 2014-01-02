class User < ActiveRecord::Base
  attr_accessible :email, :in_beijing, :name
  before_create { generate_token(:token) }
  has_many :comments

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
