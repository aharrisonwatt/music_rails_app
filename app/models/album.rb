class Album < ActiveRecord::Base

  validates :name, uniqueness: true
  validates :name, :version_type, :band_id, presence: true

  belongs_to :Band
  has_many :Tracks

end
