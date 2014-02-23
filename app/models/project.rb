class Project < ActiveRecord::Base
  has_many :keywords

  validates :name, :url, presence: true
  validates :name, :url, uniqueness: true
end
