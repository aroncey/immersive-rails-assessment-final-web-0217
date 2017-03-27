class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  validates :rating, :inclusion => { :in => 0..5 }
  belongs_to :user
end
