class Chat < ApplicationRecord
  belongs_to :quest
  has_many :messages, dependent: :destroy
  has_many :cards, dependent: :destroy
end
