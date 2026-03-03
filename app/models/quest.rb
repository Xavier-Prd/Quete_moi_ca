class Quest < ApplicationRecord
  belongs_to :user
  has_one :chat, dependent: :destroy
  has_many :cards, dependent: :destroy
end
