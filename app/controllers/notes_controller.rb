class NotesController < ApplicationController

  def index
    notes = Note.all
    newNotes = notes.map{|item|
    {
      "content": item.content,
      "id": item.id
      }
    }
    render json: newNotes
  end

  def update
    note = Note.first
    note.update(content: params["content"])
    notes = Note.all
    newNotes = notes.map{|note|
    {
      "content": note.content
      }
    }
    render json: newNotes
 end
end
