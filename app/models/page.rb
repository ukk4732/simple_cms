class Page < ActiveRecord::Base
  #ASSOCIATION
  belongs_to :subject
  has_and_belongs_to_many :editors, class_name: "AdminUser"
end
