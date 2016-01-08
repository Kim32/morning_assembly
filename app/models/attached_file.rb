class AttachedFile < ActiveRecord::Base
  validates :data, :presence => true

  #has_one :event
end
