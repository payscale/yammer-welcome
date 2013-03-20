class HomeController < ApplicationController
  require 'csv'
  require 'net/http'

  def index

    @profiles = [];
    @company_name = ""

    if current_user
      yam ||= Yam.new(current_user.token,'https://www.yammer.com/api/v1/')
     
      results = yam.get("/users") 
      page = 1
      until results.length < 1 do
        print results.length
        results.each{ |result| @profiles << result }
        results = yam.get("/users", page: page)
        page = page+1
      end
      @company_name = current_user.company
      
    end
    
    # removing people who don't want to be here
    @profiles.delete_if { |profile| (!profile["interests"].nil?) && (profile["interests"].downcase.include? 'not the welcome screen') }

    respond_to do |format|
      format.html
    end

  end
  
  def landing
    respond_to do |format|
      format.html
    end
  end
end
