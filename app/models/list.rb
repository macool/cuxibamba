class List < ActiveRecord::Base
  validates :name,
            presence: true,
            uniqueness: true
  has_many :tweets
end
