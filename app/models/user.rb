class User < ActiveRecord::Base


  has_many :journeys  # n.b: must pluralize here.
end
