class ApplicationController < ActionController::API

    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_resp
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity

    private 

    def render_not_found_resp(exception)
        render json: { errors: "#{exception.model} not found" }, status: :render_not_found_resp
    end

    def render_unprocessable_entity(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

end
