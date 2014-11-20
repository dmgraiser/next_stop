class WelcomeController < ApplicationController
  
  #we're going to be using a method we created in the application_helper.rb. Go take a look!
  include ApplicationHelper
  
  #next two lines required to access the API:
  require 'open-uri'
  require 'json'

  #welcome/home
  #just a home/landing-page
  def index
    @busnum = params[:busnum]

    @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)
    
    bus_on_road

    hash_and_msg_generator(@results, @busnum)
  end

  def nextstop
  	#the passed parameter is set to an instance variable
    @busnum = params[:busnum]
    #here we pull the real-time info from MARTA, and put it in a hash. Copy and paste the URL and get familiar with what data is in there.
    @results = JSON.parse(open("http://developer.itsmarta.com/BRDRestService/BRDRestService.svc/GetAllBus").read)

    hash_and_msg_generator(@results, @busnum)
    #find this method in the Application Helper!

  end

end
