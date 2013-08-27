class HomeController < ApplicationController
  require 'yammer'
  
  def index

    @profiles = [];
    @company_name = ""

    if current_user
      yam ||= Yammer::Client.new(:access_token  => current_user.token)
      results = yam.get("/api/v1/users") 
      page = 1
      until results.body.length < 1 do
        print results.body.length
        results.body.each{ |result| @profiles << result }
        results = yam.get("/api/v1/users", page: page)
        page = page+1
      end
      @company_name = current_user.company
      
    end
    
    # removing people who don't want to be here
    @profiles.delete_if { |profile| (!profile[:interests].nil?) && (profile[:interests].downcase.include? 'not the welcome screen') }

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
