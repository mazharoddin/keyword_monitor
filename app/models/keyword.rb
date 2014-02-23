class Keyword < ActiveRecord::Base
  belongs_to :project
  has_many :craw_results, dependent: :destroy

  validates :name, uniqueness: true
end
