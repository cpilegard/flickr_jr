class Photo < ActiveRecord::Base
  belongs_to :album
  mount_uploader :file, Uploader 
end
