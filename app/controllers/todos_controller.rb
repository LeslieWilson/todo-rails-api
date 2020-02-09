
class TodosController < ApplicationController

  def index
    todos = Todo.order("created_at DESC")
    newTodos = todos.map { |item|
      {
      "field": item.title,
      "isCompleted": item.done,
      "id": item.id
      }
    }
    render json: newTodos
  end

  def create
    todo = Todo.create(title: params["field"], done: params["isCompleted"])
    todos = Todo.order("created_at DESC")
    newTodos = todos.map{ |item|
      {
      "field": item.title,
      "isCompleted": item.done
      }
    }
    render json: newTodos
  end

  def update
    todo = Todo.find(params[:id])
    todo.update(done: !todo)

    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end
end
