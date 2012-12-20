class User < ActiveRecord::Base
  attr_accessible :email, :in_beijing, :name
end
