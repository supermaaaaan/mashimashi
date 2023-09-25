class Nori < ApplicationRecord
  
     #norisテーブルから中間テーブルに対する関連付け
  has_many :nori_tag_relations, dependent: :destroy
  #tweetsテーブルから中間テーブルを介してTagsテーブルへの関連付け
  has_many :tags, through: :nori_tag_relations, dependent: :destroy
  belongs_to :user
  # 追記箇所
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy

    mount_uploader :image, ImageUploader
end