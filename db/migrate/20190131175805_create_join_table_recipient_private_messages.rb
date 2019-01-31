class CreateJoinTableRecipientPrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :join_table_rpm do |t|
      t.belongs_to :received_message
      t.belongs_to :recipient
    end
  end
end
