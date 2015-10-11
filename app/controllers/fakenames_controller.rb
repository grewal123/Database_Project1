class FakenamesController < ApplicationController
  skip_before_filter :verify_authenticity_token 	
  def new
  
  
  #Fakename.create(gender:@gender, title:@title , givenname:@givenname, middleinitial:@middleinitial, surname:@surname , city:@city, countryfull:@countryfull,emailaddress:@emailaddress)
  end
  def index
  @fakenames = Fakename.all
  end
   def select
   @fakename = Fakename.where(:emailaddress=>params[:emailaddress]).first
   session[:query] = @fakename.emailaddress
   end
   def create
   @gender = params[:gender]
  @title = params[:title]
  @givenname = params[:givenname]
  @middleinitial = params[:middleinitial]
  @surname = params[:surname]
  @city = params[:city]
  @countryfull = params[:countryfull]
  @emailaddress = params[:emailaddress]
  @ssn = params[:ssn]
  fakename = Fakename.new
  fakename.gender = @gender
  fakename.title = @title
  fakename.givenname = @givenname
  fakename.middleinitial = @middleinitial
  fakename.surname = @surname
  fakename.city = @city
  fakename.countryfull = @countryfull
  fakename.emailaddress = @emailaddress
  fakessn =Fakessn.new
  fakessn.emailaddress = @emailaddress
  fakessn.ssn = @ssn
  fakessn.save
  fakename.save
  end
  def delete
  #@fakename = Fakename.where(:emailaddress => params[:emailaddress]).first
  Fakename.delete_all(:emailaddress => params[:emailaddress])
  Fakessn.delete_all(:emailaddress => params[:emailaddress])
  end
  def update
  @id = params[:id]
  @gender = params[:gender]
  @title = params[:title]
  @givenname = params[:givenname]
  @middleinitial = params[:middleinitial]
  @surname = params[:surname]
  @city = params[:city]
  @countryfull = params[:countryfull]
  @emailaddress = params[:emailaddress]
  @ssn = params[:ssn]
  @fakename = Fakename.where(:emailaddress=>session[:query])
  @fakessn = Fakessn.where(:emailaddress=>session[:query])
  @fakename.update_all(:title => @title,:gender =>@gender , :title => @title ,:givenname =>@givenname,:middleinitial =>@middleinitial,:surname=>@surname, :city =>@city,:countryfull =>@countryfull,:emailaddress=>@emailaddress)
  @fakessn.update_all(:emailaddress => @emailaddress , :ssn => @ssn)
  end
  def edit
  end
end
