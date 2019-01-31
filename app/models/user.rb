class User < ApplicationRecord
    has_many :gosips
    belongs_to :city
    has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
    has_many :join_table_recipient_private_messages
    has_many :received_messages, through: :join_table_recipient_private_messages
end
