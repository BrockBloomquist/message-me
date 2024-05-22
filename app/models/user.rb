class User < ApplicationRecord
    before_save { self.email = email.downcase }
    validates :username, presence: true,
                       uniqueness: { case_sensitive: false },
                       length: { minimum: 3, maximum: 25 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    length: { maximum: 105 },
                    format: { with: VALID_EMAIL_REGEX }
    has_many :messages
    has_many :invitations
    has_many :pending_invitations, -> { where confirmed: false }, class_name: "Invitation", foreign_key: "friend_id"
    validates :bio, presence: true, 
                    length: { minimum: 4, maximum: 300 }
    has_secure_password

    def friends
      friends_i_sent_invitation = Invitation.where(user_id: id, confirmed: true).pluck(:friend_id)
      friends_i_got_invitation = Invitation.where(friend_id: id, confirmed: true).pluck(:user_id)
      
      ids = friends_i_got_invitation + friends_i_sent_invitation
      User.where(id: ids)
    end

    def friends_with?(user)
      Invitation.confirmed_record?(id, user.id)
    end

    def send_invitation(user)
      invitations.create(friend_id: user.id)
    end
end
