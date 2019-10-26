require 'rest-client'
class EventsController < ApplicationController
before_action :event_params, only: [:create, :update]


def index
    @events=Event.all
    render json: @events
end
def create
    @event=Event.create!(event_params)
    render json: @event
end

def eventByCategory

  @events=Event.where(category_id: params[:id])
    render json: @events
end

def update
    @event=Event.find(params[:id])
     @event.update(event_params)
    render json: @event
end

end

private

def event_params
 params.permit(:name, :description, :image, :url, :category_id, :user_id, :address, :location_lat, :location_long, :date, :start_time, :end_time)
end

