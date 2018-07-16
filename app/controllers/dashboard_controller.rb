class DashboardController < ApplicationController
  
  def index
    @city = (params[:search] && params[:search][:city_name]) ? params[:search][:city_name] : "Santa Clara"
    result = HTTParty.get("https://query.yahooapis.com/v1/public/yql?q=select * from weather.forecast where woeid in (select woeid from geo.places(1) where text='"+ @city +"')")
    @response = result.parsed_response if result.parsed_response['query']['results']
  end
end