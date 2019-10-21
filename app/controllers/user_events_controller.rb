class UserEventsController < ApplicationController
#  before_action :user_event_params, only: [:create, :update]
before_action :find_user_event, only: [ :show, :update]

   def index
      @user_events=UserEvent.all
      render json: UserEventSerializer.new(@user_events)
   end

   def show
      render json: UserEventSerializer.new(@user_event)
   end

   def create 
      @user_event=UserEvent.find_by(event_id: params[:event_id])
     
      if @user_event
         
            render json: {message: 'Event already exist!'}
      
      else
         
            @user_event=UserEvent.create!(user_event_params)
            render json: UserEventSerializer.new(@user_event)
      end
      
   end

   def update
      @user_event.update(user_event_params)
      render json: UserEventSerializer.new(@user_event)
   end

   def destroy
      @user_event=UserEvent.find_by(event_id: params[:id])
      @user_event.destroy
      render json: {message: 'deleted'}
   end

private

   def find_user_event
      @user_event=UserEvent.find(params[:id])
   end

   def user_event_params
      params.permit(:user_id, :event_id)
   end
end
