class Card < ApplicationRecord
  CATEGORY = ["mage", "warrior", "rogue"]
  belongs_to :chat
  belongs_to :quest
  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORY }
end
