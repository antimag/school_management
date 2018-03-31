class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  GENDER= ["Male", "Female", "Other"]
  LANGUAGE= ["Hindi", "English", "Other"]
  CATEGORY= ["General","OBC", "SC", "ST"]
  RELIGION= ["Hindu", "Muslim", "Other"]
  
  def full_name
    "#{first_name} #{middle_name} #{last_name}"
  end

  def full_address
    "#{address_line1}, #{address_line2}, #{city}, #{state}, #{country}, #{pin_code}"
  end
end
