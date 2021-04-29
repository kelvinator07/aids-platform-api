class ApplicationController < ActionController::API
    require 'pry'

    rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

    def render_jsonapi_response(resource)
        if resource.errors.empty?
            render jsonapi: resource
        else
            render jsonapi_errors: resource.errors, status: 400
        end
    end

    def record_not_unique(message)
        render json: {
          'errors': [
            {
              'status': '400',
              'title': message
            }
          ]
        }, status: 400
    end

    def responsenew(value)
      response = {
        status: "00",
        message: "Success",
        data: value.as_json()
      }
    end

    def success(value)
      response = {
        status: "00",
        message: "Success",
        data: {
          users: value.as_json(except: [:password_digest, :updated_at])
        }
      }
    end

    def successnew(value, token)
      response = {
        status: "00",
        message: "Success",
        data: {
          user: value.as_json(except: [:password_digest, :updated_at]),
          token: token
        }
      }
    end

    def failure(value)
      response = {
        status: "99",
        message: value,
        data: "null"
      }
    end

end
