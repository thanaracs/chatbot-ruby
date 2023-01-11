class Api::V1::MessagesController < ApplicationController
    def index
        render json: VerifierService.new(Message.last.content.downcase).call
    end


end