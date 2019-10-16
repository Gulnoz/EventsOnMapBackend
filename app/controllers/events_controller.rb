require 'rest-client'
class EventsController < ApplicationController

EVENT_API_TOKEN = ENV['event_brite_api_token']

def index
    @link='https://www.eventbriteapi.com/v3/events/search/?expand=venue,category&token='+EVENT_API_TOKEN+'&location.latitude=40.7128&location.longitude=-73.935242'
@events= RestClient.get (@link)
parsed = JSON.parse(@events)
render json: parsed["events"]
end

def getCategory
@key='Bearer '+EVENT_API_TOKEN
@categories= RestClient::Request.execute(method: :get, url: 'https://www.eventbriteapi.com/v3/categories/',
                            payload: 'foo', headers: { 
                                'Content-Type': 'application/json',
                                'Authorization': @key})
parsed = JSON.parse(@categories)
render json: parsed["categories"]

end

def eventByCategory
    @link='https://www.eventbriteapi.com/v3/events/search/?expand=venue,category&token='+EVENT_API_TOKEN+'&location.latitude=40.7128&location.longitude=-73.935242'
    @events= RestClient.get (@link)
parsed = JSON.parse(@events)
render json: parsed["events"].select{ |event| event["category_id"] == params[:id] }
    
end

end
