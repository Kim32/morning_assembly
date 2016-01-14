class Event < ActiveRecord::Base
  enum category: [:human, :holiday]
end
