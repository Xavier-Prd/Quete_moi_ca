class Card < ApplicationRecord
  belongs_to :chat
  belongs_to :quest
end
