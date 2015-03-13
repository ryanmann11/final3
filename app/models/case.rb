 class Case < ActiveRecord::Base
  belongs_to :firm
  has_many :reviews
  belongs_to :giver

  validates :name, presence: true
  validates :firm, presence: true
  validates :summary, presence: true
  validates :difficulty, presence: true
  validates :topic, presence: true
end
