class MessagesController < ApplicationController
  before_action :auth_user

  def index
    @received = @user.received_messages
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message].permit(:subject, :body))
    @message.receiver = User.where(email: params[:message][:email]).limit(1).first
    @message.sender = @user
    if @message.save
      redirect_to messages_path
    else
      render 'new'
    end
  end
end
