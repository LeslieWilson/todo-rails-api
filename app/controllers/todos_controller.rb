

class TodosController < ApplicationController

  def index
    todos = Todo.order("created_at DESC")
    newTodos = todos.map { |item|
      {
            "field": item.title,
            "isCompleted": item.done
        }
     }
    render json: newTodos

  end

  def create
    todo = Todo.create(todo_param)
    render json: todo
  end

  def update
    todo = Todo.find(params[:id])
    todo.update_attributes(todo_param)
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end

  private

  def todo_param
    params.require(:todo).permit(:title, :done)
  end
end
