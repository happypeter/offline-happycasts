class Event < ActiveRecord::Base
  attr_accessible :title, :content, :time

  has_many :comments
end
