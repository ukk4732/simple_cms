class Page < ActiveRecord::Base
  #ASSOCIATION
  belongs_to :subject
  has_and_belongs_to_many :editors, class_name: "AdminUser"
  has_many :sections

  #SCOPE
  scope :sorted, lambda { order("pages.position ASC") }

end
