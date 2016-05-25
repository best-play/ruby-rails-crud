class Api::BaseController < ::ApplicationController
  before_action :authorize_user
  skip_before_action :verify_authenticity_token

  def render_response(data, status = 200)
    render json: data, status: status
  end

  def render_error(data, status = 400)
    render json: data, status: status
  end

  rescue_from ActiveRecord::RecordNotFound do |e|
    render_error({
        "error": {
            "message": "Entity not found"
        }
    }, 404)
  end

  rescue_from ActiveRecord::RecordInvalid do |e|
    render_error({
        "error": {
            "message": e.record.errors
        }
    }, 422)
  end

  rescue_from UnauthorizedError do |e|
    render_error({
        "error": {
            "message": "User not authorized"
        }
    }, 401)
  end

  private
  def authorize_user
    @current_session = authenticate_with_http_token do |token, options|
      Session.auth_with_token token
    end

    if @current_session
      @user = User.find @current_session.user_id
    end

    raise UnauthorizedError.new unless @current_session
  end
end