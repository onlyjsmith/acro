class Acronym < ActiveRecord::Base
  belongs_to :list
  
  # scope :is_acronym, where(:is_acronym != false)
end
