class Message < ApplicationRecord
    belongs_to :user
    validates :body, presence: true
    after_create_commit { broadcast_append_to :messages_list, target: "chatroom" }
end
