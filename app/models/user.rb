class User < ActiveRecord::Base
  attr_accessible :email, :in_beijing, :name, :password, :password_confirm
  before_create { generate_token(:token) }

  #validates :name, :email, :password, :password_confirm, presence: true

  def password
    @password
  end
  def password_confirm
    @password_confirm
  end

  def password=(pass)
    @password = pass
    generate_password_digest(pass)
  end
  def password_confirm=(pass_confirm)
    @password_confirm = pass_confirm
  end


  def self.authenticate(name_or_email, password)
    user = User.find_by_name(name_or_email)
    user ||= User.find_by_email(name_or_email)

    if user && user.password_digest == Digest::SHA256.hexdigest(password)
      return user
    else
      false
    end
  end

  private
  def generate_password_digest(pass)
    self.password_digest = Digest::SHA256.hexdigest(pass)
  end
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end
end
