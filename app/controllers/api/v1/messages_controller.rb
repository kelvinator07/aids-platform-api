class Api::V1::MessagesController < Api::V1::BaseController

  # GET /messages
  def index
    @messages = Message.all
    render json: { total: @messages.size, messages: @messages }, status: 200
  end

  # GET /messages/:response_id
  def response_messages
    @messages = Message.includes(:user).where(response_id: params[:response_id])
    render json: @messages, :include => { :user => { :only => [:id, :firstname, :lastname] } }
  end

  # POST /messages
  def create
    @response = Response.includes(:messages, :user).find(params['response_id'])

    if @response
      @message = @response.messages.create(user_id: current_user.id, content: params['content'], request_id: @response.request_id)

      if @message.save
        # how to broadcast here

        MessagesChannel.broadcast_to('message_channel', @response.messages)

        render json: { message:  @message.as_json(:methods => [:firstname] )}, status: 200
      else
        @error = @message.errors.full_messages.to_sentence
        render json: failure(@error), status: :unprocessable_entity
      end

    else
      @error = @request.errors.full_messages.to_sentence
      render json: failure(@error), status: :unprocessable_entity
    end

  end

end
