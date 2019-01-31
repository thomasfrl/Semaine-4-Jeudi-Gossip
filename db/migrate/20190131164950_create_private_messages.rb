class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.references :join_table_rpm, index: true
      t.references :sender, index: true
    end
  end
end
