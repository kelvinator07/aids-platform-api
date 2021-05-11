class MessagesChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # my subscriptions are being created on the RoomWebSocket component from the frontend
    # @request = Response.find_by(id: params[:response])
    @response = Response.find(params[:response])

    # ROOM = Users + Messages
    # RESPONSE = 2 Users + Messages

    # Channel id = channel_name

     puts @response.channel_name
    # stream_for @response.channel_name
    stream_from 'message_channel'
  end

  def unsubscribed
    # any cleanup needed when channel is unsubscribed
  end
end
