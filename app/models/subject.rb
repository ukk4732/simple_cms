class Subject < ActiveRecord::Base
  #ASSOCIATION
  has_many :pages
  #VALIDATION
  validates_presence_of :name
  #SCOPES
  scope :visible, lambda { where(visible: true) }
  scope :invisible, lambda { where(visible: false) }
  scope :sorted, lambda { order("subjects.position ASC") }
  scope :newest_first, lambda { order("subjects.created_at DESC") }
  scope :search, lambda { |query|
    where("name LIKE ?","%#{query}%")
   }
end
