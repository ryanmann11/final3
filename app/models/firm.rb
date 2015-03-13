class Firm < ActiveRecord::Base
  has_many :cases
  has_many :givers
end
