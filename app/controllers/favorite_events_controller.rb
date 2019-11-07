class FavoriteEventsController < ApplicationController
#  before_action :user_event_params, only: [:create, :update]
before_action :find_favorite_event, only: [ :show, :update]

   def index
      @favorite_events=FavoriteEvent.all
      render json: FavoriteEventSerializer.new(@favorite_events)
   end

   def show
      render json: FavoriteEventSerializer.new(@favorite_event)
   end

   def create 
      @favorite_event=FavoriteEvent.find_by(user_id: params[:user_id], event_id: params[:event_id])
     
      if @favorite_event
         
            render json: {message: 'Event already exist!'}
      
      else
         
            @favorite_event=FavoriteEvent.create!(favorite_event_params)
            render json: FavoriteEventSerializer.new(@favorite_event)
      end
      
   end

   def update
      @favorite_event.update(favorite_event_params)
      render json: FavoriteEventSerializer.new(@favorite_event)
   end

   def destroy
      @favorite_event=FavoriteEvent.find_by(event_id: params[:id])
      @favorite_event.destroy
      render json: {message: 'deleted'}
   end

private

   def find_favorite_event
      @favorite_event=FavoriteEvent.find(params[:id])
   end

   def favorite_event_params
      params.permit(:user_id, :event_id)
   end
end
