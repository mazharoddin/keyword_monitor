class Project < ActiveRecord::Base
  has_many :keywords, dependent: :destroy

  validates :name, :url, presence: true
  validates :name, :url, uniqueness: true
end
