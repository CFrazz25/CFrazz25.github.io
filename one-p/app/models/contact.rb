class Contact < ApplicationRecord
  validates_presence_of :name, :number, :email
  
end
