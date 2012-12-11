class Event < ActiveRecord::Base
  attr_accessible :title, :content, :time
end
