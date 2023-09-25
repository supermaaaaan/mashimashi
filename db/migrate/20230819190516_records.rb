class Records < ActiveRecord::Migration[7.0]
  def change
    drop_table :tweet_tag_relations
  end
end
