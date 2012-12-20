class User < ActiveRecord::Base
  attr_accessible :admin, :email, :in_beijing, :name
end
