class Api::SessionsController < Api::BaseController
  skip_before_action :authorize_user, only: :create

  def create
    session = Session.auth_with_credentials(
        params[:username], params[:password]
    )
    render_response session, 201
  end

  def destroy
    @current_session.destroy

    render_response nil, 204
  end
end