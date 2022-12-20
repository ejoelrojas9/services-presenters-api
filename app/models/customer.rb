class Customer < ApplicationRecord
  has_many :manager

  def name
    "#{first_name} #{last_name}"
  end
  
end
