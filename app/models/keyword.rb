class Keyword < ActiveRecord::Base
  belongs_to :project

  serialize :positions, Array
end
