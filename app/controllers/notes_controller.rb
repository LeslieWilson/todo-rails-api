class NotesController < ApplicationController


  def index
    notes = Note.order("created_at DESC")
    newNotes = notes.map{|item|
    {
      "content": item.content,
      "id": item.id
      }
    }
    render json: newNotes
  end

end
