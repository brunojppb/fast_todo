class Api::V1::TodosController < Api::ApiController

  before_action :authenticate_with_token!

  def index
    todos = current_user.todos
    render json: todos, status: 200
  end

  def show
    todo = current_user.todos.find_by(id: params[:id])
    if !todo.nil?
      render json: todo, status: 200
    else
      render json: { errors: 'todo not found' }, status: 422
    end
  end

  def create
    puts "PARAMS: #{params}"
    todo = current_user.todos.build(todo_params)
    if todo.save
      render json: todo, status: 201, location: [:api, todo]
    else
      render json: ErrorSerializer.serialize(todo.errors), status: 422
    end
  end

  def update
    todo = current_user.todos.find_by(id: params[:id])
    if !todo.nil?
      if todo.update(todo_params)
        render json: todo, status: 200
      else
        render json: { errors: todo.errors }, status: 422
      end
    else
      render json: { errors: 'todo not found' }, status: 422
    end
  end

  def destroy
    todo = current_user.todos.find_by(id: params[:id])
    if !todo.nil?
      todo.destroy
        head 204
    else
      render json: { errors: 'todo not found' }, status: 422
    end
  end

  private
    def todo_params
      params.require(:data).require(:attributes).permit(:title, :body, :due_date, :completed, :remember)
    end

end
