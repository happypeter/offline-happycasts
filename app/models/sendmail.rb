class Sendmail < ActiveRecord::Base
  attr_accessible :content, :subject
end
