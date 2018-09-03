class Stat < ApplicationRecord
  serialize :hash
  belongs_to :app
end
