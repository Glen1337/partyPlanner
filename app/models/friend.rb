class Friend < ActiveRecord::Base
  has_many :attendees
  has_many :parties, through: :attendees

  validates :first_name, presence: true, length: {minimum: 1, maximum: 50}
  validates :last_name, presence: true, length: {minimum: 1, maximum: 50}
end
