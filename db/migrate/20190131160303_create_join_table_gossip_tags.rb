class CreateJoinTableGossipTags < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_gossip_tags do |t|
      t.belongs_to :gosip, index: true
      t.belongs_to :tag, index: true
    end
  end
end
