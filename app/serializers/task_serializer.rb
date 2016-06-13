class TaskSerializer < BaseSerializer
  attributes :id, :image_id, :status, :operation, :params
end