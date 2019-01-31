class PrivateMessage < ApplicationRecord
    belongs_to :sender, class_name: "User"
    has_many :join_table_recipient_private_messages
    has_many :recipients, through: :join_table_recipient_private_messages
end
