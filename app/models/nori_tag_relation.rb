class NoriTagRelation < ApplicationRecord
  belongs_to :nori
  belongs_to :tag
end
