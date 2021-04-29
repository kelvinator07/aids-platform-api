class Api::V1::RequestsController < Api::V1::BaseController

    # GET /requests
    def index
      @requests = Request.unfulfilled_and_less_than_five
      render json: { total: @requests.size, requests: @requests }, status: 200
    end

     # GET /requests by user
     def userrequests
      @requests = Request.where(user_id: params[:user_id])
      render json: { total: @requests.size, requests: @requests.as_json(:methods => [:is_republishable] ) }, status: 200
    end

    # POST /requests
    def create
      @user = current_user
      if @user
        @request = @user.requests.create!(request_params)

        if @request.valid?
          render json: responsenew(@request), status: 201
        else
          @error = @request.errors.full_messages.to_sentence
          render json: failure(@error), status: :unprocessable_entity
        end

      else
        @error = @user.errors.full_messages.to_sentence
        render json: failure(@error), status: :unprocessable_entity
      end

    end

    # GET /requests/:id
    def show
      json_response(@request)
    end

    # PUT /requests/:id
    def update
      @request = Request.find(params[:id])

      if @request.update(params.permit(:fulfilled))
        render json: responsenew(@request), status: 200
      else
        @error = @request.errors.full_messages.to_sentence
        render json: failure(@error), status: :unprocessable_entity
      end
    end

    def republish
      @request = Request.where(id: params[:request_id])

      if @request
          responses = Response.where(request_id: params[:request_id])
          if responses
            responses.destroy_all
            return render json: { }, status: 200
          else
            return render json: { }, status: 400
          end
        else
          return render json: { }, status: 400
        end
    end

    # DELETE /requests/:id
    def destroy
      @request.destroy
      head :no_content
    end

    private

    def request_params
      params.permit(:description, :request_type, :lat, :lng)
    end

    def set_request
      @request = Request.find(params[:id])
    end
end
