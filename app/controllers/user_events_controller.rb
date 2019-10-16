class UserEventsController < ApplicationController
#  before_action :user_event_params, only: [:create, :update]
before_action :find_user_event, only: [:destroy, :show, :update]
 
    def index
       @user_events=UserEvent.all
       render json: UserEventSerializer.new(@user_events)
    end
    
    def show
       render json: UserEventSerializer.new(@user_event)
    end

    def create 
       @user_event=UserEvent.create!(user_event_params)
       render json: UserEventSerializer.new(@user_event)
    end

    def update
       @user_event.update(user_event_params)
       render json: UserEventSerializer.new(@user_event)
    end

    def destroy
       @user_event.destroy
    end

private

    def find_user_event
       @user_event=UserEvent.find(params[:id])
    end

    def user_event_params
        params.permit(:user_id, :event_id)
    end
end
