class BodyStat < ApplicationRecord
  belongs_to :user
  validates_numericality_of :body_fat,:weight, :height, :waist, :chest, :arms, :forearms, :hips, :neck, :shoulders, :thighs, :calves
end
