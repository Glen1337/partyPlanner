class Party < ActiveRecord::Base
  has_many :attendees
  has_many :friends, through: :attendees

  validates :name, presence: true, uniqueness: false, length: {minimum: 1}
  validates :location, presence: true, length: {minimum: 1}
  validates :description,  presence: true
end
