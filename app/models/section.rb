class Section < ActiveRecord::Base
  #ASSOCIATION
  has_many :section_edits
  belongs_to :page
  has_many :editors, class_name: "AdminUser", through: :section_edits

  #SCOPE
  scope :sorted, lambda {order("sections.position ASC")}
end
