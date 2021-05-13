class MessagesChannel < ApplicationCable::Channel

  def subscribed
      stream_for specific_channel
   end

   def unsubscribed
     # any cleanup needed when channel is unsubscribed
   end

   private
   def specific_channel
     "response_#{params[:id]}"
   end

end
