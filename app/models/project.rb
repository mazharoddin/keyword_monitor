class Project < ActiveRecord::Base
  has_many :keywords

  validates :name, presence: true
  validates :name, uniqueness: true
end
