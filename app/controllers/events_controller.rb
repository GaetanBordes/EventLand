class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new
  end

  # Formulaire pour créer un nouvel événement
  def new
    @event = Event.new
  end

  # Créer un nouvel événement
  def create
    @event = Event.new(event_params)
    @event.admin = current_user

    if @event.save
      redirect_to @event, notice: 'Événement créé avec succès.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :start_date, :duration, :price, :location)
  end
end