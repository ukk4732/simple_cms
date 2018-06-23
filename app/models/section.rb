class Section < ActiveRecord::Base
  #ASSOCIATION
  has_many :section_edits
  has_many :editors, class_name: "AdminUser", through: :section_edits
end
