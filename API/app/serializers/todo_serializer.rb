class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :completed, :remember, :created_at
end
