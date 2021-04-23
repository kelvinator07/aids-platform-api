class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # my subscriptions are being created on the RoomWebSocket component from the frontend
    # @request = Response.find_by(id: params[:response])
    @response = Response.find(params[:response])

    # ROOM = Users + Messages
    # RESPONSE = 2 Users + Messages

    # Channel id = channel_name

    stream_for @response.channel_name
  end

  # the second argument to broadcast_to matches the information that I am getting from the frontend, and passing from the MessagesController create action
  # def received(data)
  #   p data
  #   MessagesChannel.broadcast_to(@response.channel_name, @response.messages)
  # end

  def unsubscribed
    # any cleanup needed when channel is unsubscribed
  end
end
