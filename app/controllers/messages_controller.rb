class MessagesController < ApplicationController
    before_action :set_conversation

    def create
        if params[:body].blank?
             flash.now.alert = "Message cannot be empty"
             render "conversations/show"
        else
            receipt = current_user.reply_to_conversation(@conversation, params[:body])
            redirect_to conversation_path(receipt.conversation)
        end

    end

    private
    def set_conversation
        @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end
end