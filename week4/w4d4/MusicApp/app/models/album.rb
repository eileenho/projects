class Album < ActiveRecord::Base
  validates :album_name, presence: true

  belongs_to :band
end
