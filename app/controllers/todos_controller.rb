
# overview
# start with create new rails api which leaves out views, made a controller where Id write actions that interact with my models. made some models, made a database migration and made routes. the models interact with the database(see models for notes). routes let you interact with your server via http, it defines the urls when a request is sent there. It routes it. It sends that request to the controller and you define some action to be taken on that request. (see routes)

class TodosController < ApplicationController

# this index method is setting todos to the Todo object in your model, which is connected to a table in my database, and .order is ordering them by their created at date and descending is sql. This is so latest task is at the top of the list.

# mapping through whatever is in the todo table (through the model), mapping through it and for each item making sure it has a field and iscompleat key value. Im renaming things because didint have field and iscompleate, had title and done.
# setting that new array to todos and rendering it as json.

  def index
    # here its getting stuff from the database
    todos = Todo.order("created_at DESC")
    # here its formatting stuff stuff
    newTodos = todos.map { |item|
      {
      "field": item.title,
      "isCompleted": item.done,
      "id": item.id
      }
    }
     # here its sending stuff to the front end
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
    if todo.done == true
      todo.update(done:false)
    elsif todo.done == false
      todo.update(done:true)
    end
    render json: todo
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    head :no_content, status: :ok
  end
end
