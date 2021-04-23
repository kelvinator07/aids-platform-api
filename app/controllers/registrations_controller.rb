class RegistrationsController < Devise::RegistrationsController
    # skip_before_action :verify_authenticity_token
    before_action :configure_permitted_parameters, if: :devise_controller?

    def create
        build_resource(sign_up_params)
        # binding.pry
        resource.save
        sign_up(resource_name, resource) if resource.persisted?

        render_jsonapi_response(resource)
    end

    protected

    def configure_permitted_parameters
        # devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :firstname, :lastname])
        devise_parameter_sanitizer.permit(:sign_up) do |user|
            user.permit(:email, :firstname, :lastname)
        end
    end 

    private

    def sign_up_params
        params.permit([:email, :firstname, :lastname, :password, :picture])
    end

end