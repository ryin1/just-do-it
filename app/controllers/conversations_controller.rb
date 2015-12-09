class ConversationsController < ApplicationController
  before_action :set_mailbox
  before_action :set_conversation, except: [:index]

  def show
  end

  def index
    @conversations = @mailbox.inbox
  end

  def reply
    current_user.reply_to_conversation(@conversation, params[:body])
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  private

  def set_mailbox
    @mailbox ||= current_user.mailbox
  end
  
  def set_conversation
    @conversation ||= @mailbox.conversations.find(params[:id])
  end
end
