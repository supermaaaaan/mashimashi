class Like < ApplicationRecord
  belongs_to :nori
  belongs_to :user
  validates_uniqueness_of :nori_id, scope: :user_id

end
