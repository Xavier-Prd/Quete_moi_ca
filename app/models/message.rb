class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :card, optional: true
  validates :content, presence: true
  validates :role, presence: true
end
