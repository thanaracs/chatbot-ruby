class Response < ApplicationRecord
    validates_presence_of :content
    belongs_to :message_verifier
end
