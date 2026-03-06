class Card < ApplicationRecord
  # CATEGORY = ["mage", "warrior", "rogue"] remplacés par le prompt de l'IA
  belongs_to :chat
  belongs_to :quest
  has_one :message
  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true
  validates :category, presence: true
end
