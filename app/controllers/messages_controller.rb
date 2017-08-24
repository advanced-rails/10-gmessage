class MessagesController < ApplicationController
  before_action :auth_user

  def index
    @received = @user.received_messages
  end

  def sent
    @received = @user.sent_messages
    render 'index'
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

  def destroy
    msg = Message.find(params[:id])
    msg.delete
    redirect_to messages_path
  end

  def show
    @message = Message.find(params[:id])
  end
end
