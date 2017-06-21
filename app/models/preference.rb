class Preference < ApplicationRecord
  belongs_to :user
  serialize :unit_for_measure
end
