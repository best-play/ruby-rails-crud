class Api::TasksController < Api::BaseController
  before_action :find_image, only: [:create]

  def index
    render_response @user.tasks
  end

  def show
    render_response Task.find_by!(id: params[:id], user_id: @current_session.user_id)
  end

  def create
    task = Task.new(
        user: @user,
        image: @image,
        operation: params[:operation],
        params: params[:params],
        status: 'new'
    )
    task.save!

    TaskWorker.perform_async(task.id)

    render_response task, 201
  end

  private
  def find_image
    @image = Image.find(params[:image])
  end
end