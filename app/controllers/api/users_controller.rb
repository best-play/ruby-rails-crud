class Api::UsersController < Api::BaseController
  skip_before_action :verify_authenticity_token, only: :create

  def index
    render_response User.all
  end

  def show
    render_response User.find params[:id]
  end

  def create
    user = User.new user_params

    if user.save!
      render_response user, 201
    end
  end

  def update
    user = User.find params[:id]

    if user.update! user_params
      render_response user, 200
    end
  end

  def destroy
    user = User.find params[:id]
    user.destroy

    render_response nil, 204
  end

  private
  def user_params
    params.permit(:username, :email, :password)
  end
end
