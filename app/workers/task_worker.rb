class TaskWorker
  include Sidekiq::Worker
  def perform(task_id)
    task = Task.find task_id
    task.update!(status: 'pending')

    #do something next ...
  end
end