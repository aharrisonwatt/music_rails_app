class Album < ActiveRecord::Base

  belongs_to :Band
  has_many :Tracks
  
end
