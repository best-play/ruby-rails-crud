class Api::ImagesController < Api::BaseController
  def index
    render_response Image.where(
        :user_id => @current_session.user_id
    ).page params[:page]
  end

  def create
    image = Image.new(
        user: @user,
        image: user_params
    )
    image.remote_image_url = params['image']

    if image.save!
      render_response image, 201
    end
  end

  def destroy
    image = Image.find_by(
        :id => params[:id],
        :user_id => @current_session.user_id
    )

    if image
      image.destroy
    else
      raise ActiveRecord::RecordNotFound
    end

    render_response nil, 204
  end

  private
  def user_params
    params.permit(:image)
  end
end