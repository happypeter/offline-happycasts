class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @default_time = Event.last.nil? ? Time.now : Event.last.time + 7.days
  end

  def create
    event = Event.new(params[:event])
    if event.save
      redirect_to :root, :notice => "New event created successfully!"
    else
      redirect_to :root, :notice => "Failed to creat new event!"
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
