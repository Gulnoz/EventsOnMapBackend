require 'rest-client'
class EventsController < ApplicationController
before_action :categories, only: [:index]
EVENT_API_TOKEN = ENV['event_brite_api_token']

def index
    # @link='https://www.eventbriteapi.com/v3/events/search/?expand=venue,category&token='+EVENT_API_TOKEN+'&location.latitude=40.739288&location.longitude=-73.941860'
@events= RestClient::Request.execute(method: :get, url:'https://api.predicthq.com/v1/events/?category=conferences&limit=60&within=100km%4040.7128%2C-74.0060',
 payload: 'foo', headers: { 
                                'Content-Type': 'application/json',
                                'Authorization': 'Bearer 6JWqAaNpdk-GM62tTmNCbvaMCEii9BnNl-6weLnc'})
parsed = JSON.parse(@events)
eventObjects=[]
categories=@parsedCategories['categories']
parsed["results"].each do |event|
    addressObj=[]
    event['entities'].each {|el| addressObj=el["formatted_address"] }
    obj={
    id: event['id'],
    name: {text: event['title']},
    description: {
        text: event['description']
     } ,
    category: {
        id: categories[event['category']],
        short_name: event['category']
    },
    venue:{
        address:{
            latitude: event['location'][1],
            longitude: event['location'][0],
            localized_multi_line_address_display: addressObj
        }
    },
    start: {
        local: event['start']
    },
    end: {
        local: event['end']
    }

}
    eventObjects.push(obj)
end
render json: eventObjects
end

def getCategory
# @key='Bearer '+EVENT_API_TOKEN
# @categories= RestClient::Request.execute(method: :get, url: 'https://www.eventbriteapi.com/v3/categories/',
#                             payload: 'foo', headers: { 
#                                 'Content-Type': 'application/json',
#                                 'Authorization': @key})
@categories= RestClient::Request.execute(method: :get, url:'https://api.predicthq.com/v1/events/count/?limit=10',
  
 payload: 'foo', headers: { 
                                'Content-Type': 'application/json',
                                'Authorization': 'Bearer 6JWqAaNpdk-GM62tTmNCbvaMCEii9BnNl-6weLnc'})
parsed = JSON.parse(@categories)
@categoryObject=[]
parsed["categories"].each do |key, value|
obj={
    id: value,
    short_name: key
}
    @categoryObject.push(obj)
end

render json: @categoryObject

end

def eventByCategory
    @link='https://www.eventbriteapi.com/v3/events/search/?expand=venue,category&token='+EVENT_API_TOKEN+'&location.latitude=40.7128&location.longitude=-73.935242'
    @events= RestClient.get (@link)
parsed = JSON.parse(@events)
render json: parsed["events"].select{ |event| event["category_id"] == params[:id] }
    
end

def categories
@categories= RestClient::Request.execute(method: :get, url:'https://api.predicthq.com/v1/events/count/?limit=10',
  
 payload: 'foo', headers: { 
                                'Content-Type': 'application/json',
                                'Authorization': 'Bearer 6JWqAaNpdk-GM62tTmNCbvaMCEii9BnNl-6weLnc'})
@parsedCategories = JSON.parse(@categories)

end

end
