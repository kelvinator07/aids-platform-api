class Api::V1::ResponsesController < Api::V1::BaseController
  require 'pry'

  # GET /responses
  def index
    render json: { responses: current_user.responses.order(created_at: :desc).collect{ |r| r.as_json(:include => [:messages, :request] )},
        requests: current_user.requests.order(created_at: :desc).collect{ |r| r.as_json(:include => :messages )}
       }, status: 200
  end

  # POST /responses
  def create
    @request = Request.find(params['request_id'])
    if @request
      @response = @request.responses.create!(user_id: current_user.id)

      if @response.valid?
        render json: responsenew(@response), status: 201
      else
        @error = @response.errors.full_messages.to_sentence
        render json: failure(@error), status: :unprocessable_entity
      end

    else
      @error = @request.errors.full_messages.to_sentence
      render json: failure(@error), status: :unprocessable_entity
    end

  end


  private

  def response_params
    params.fetch(:response).permit(:request_id)
  end

end
