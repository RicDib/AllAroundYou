class MessagesController < ApplicationController
  before_action :set_conversation


  def create
    receipt = current_user.reply_to_conversation(@conversation, params[:body])
    current_user.notify(receipt, "", nil, true, nil, false)
    redirect_to conversation_path(receipt.conversation)
  end

  private

    def set_conversation
      @conversation = current_user.mailbox.conversations.find(params[:conversation_id])
    end

end
