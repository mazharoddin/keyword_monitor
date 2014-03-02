class Keyword < ActiveRecord::Base
  belongs_to :project
  has_many :crawl_results, dependent: :destroy

  validates :name, uniqueness: true
end
