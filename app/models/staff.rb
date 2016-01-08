class Staff < ActiveRecord::Base
  validates :name, :presence => true
  validates :kana, :presence => true
end
