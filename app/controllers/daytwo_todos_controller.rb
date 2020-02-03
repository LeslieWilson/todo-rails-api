class DaytwoTodosController < ApplicationController

  def index
    todos = DaytwoTodo.order("created_at DESC")
    newTodos = todos.map{|item|
    {
      "field":item.field,
      "isCompleted":item.isCompleted,
      "id": item.id
      }
    }
    render json: newTodos
  end

  def create
    todos = DaytwoTodo.create(field: params["field"], isCompleted: params["isCompleted"])
    todos = DaytwoTodo.order("created_at DESC")
    newTodos = todos.map{|item|
    {
      "field":item.field,
      "isCompleted":item.isCompleted,
      "id":item.id
      }
    }
    render json: newTodos
  end

end
