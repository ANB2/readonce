class MessagesController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :html # responders are packaging workflows in controllers
  
  
  def index
  end
  
  def new
    # @message = Message.new  # bad design
    
  end
  
  def create
    # Message.create message_params
    #@message = Message.create(message_params)
    @message = current_user.messages.create(message_params)
    respond_with message, location: messages_url
  end
  
  private
  
  def message_params
    params[:message].permit :body
  end
  
  
  # views can work in isolation
  def message
    @message ||= Message.new # 
  end
  helper_method :message  # exposing to the view
  
  def messages
 #   @messages ||= Message.all
    @messages ||= current_user.messages
  end
  helper_method :messages
  
  def receivers
    @receivers ||= User.all
  end
  helper_method :receivers
end
