class Restaurant < ApplicationRecord

  validates_presence_of :name, :address_1, :address_2, :city
end
