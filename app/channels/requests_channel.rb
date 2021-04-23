class RequestsChannel < ApplicationCable::Channel
     # when a user is 'subscribed' it means that they have loaded the relevant page and are viewing it

  def subscribed
    # stream_from "some_channel"
    # my subscriptions are being created on the RoomWebSocket component from the frontend
    @request = Request.find_by(id: params[:request])
    # @request = Request.find(params[:request])

    stream_for @request
  end

  # the second argument to broadcast_to matches the information that I am getting from the frontend, and passing from the MessagesController create action
  def received(data)
    RequestsChannel.broadcast_to(@request, {request: @request, users: @request.users, messages: @request.messages})
  end

  def unsubscribed
    # any cleanup needed when channel is unsubscribed
  end

end
