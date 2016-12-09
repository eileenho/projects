class Track < ActiveRecord::Base
  validates :track_name, :album_id, presence: true

  belongs_to :album

  has_one :band,
    through: :album,
    source: :Band

end
