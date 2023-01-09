class MessagesController < ApplicationController
    def create
        @message = Message.new(messages_params)

        if @message.salve
            redirect_to request.referrer, notice: 'Messagem salva com sucesso!'
        else
            redirect_to request.referrer, alert: 'Erro ao enviar mensagem!'
        end
    end

    private

    def messages_params
        params.require(:message).permit(:content)
    end
end
