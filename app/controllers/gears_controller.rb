class GearsController < ApplicationController

  def index
    @gears = Gear.all
    @last_viewed_array = []
    session[:ids] ||= []
    session[:ids].each do |gear_id|
      @last_viewed_array << Gear.find_by(:id => gear_id)
    end
  end

  def show
    @gear = Gear.find_by(:id => params[:id])

    # session[:img] = []
    # session[:img] << params[:img]
    # session[:name] = params[:name]
    # session[:category] = params[:category]
    # session[:price] = params[:price]
    # if session[:gears_ids].nil?
      session[:ids] ||= []
    # end
    session[:ids] << @gear.id
    # raise session[:ids].inspect
  end

  def new
    @gear = Gear.new
  end

  def create
    @gear = Gear.new
    @gear.name = params[:gear][:name]
    @gear.category = params[:gear][:category]
    @gear.price = params[:gear][:price]
    @gear.image_url = params[:gear][:image_url]

    if @gear.save
      redirect_to gears_url
    else
      render 'new'
    end
  end

  def edit
    @gear = Gear.find_by(:id => params[:id])
  end

  def update
    @gear = Gear.find_by(:id => params[:id])
    @gear.name = params[:gear][:name]
    @gear.category = params[:gear][:category]
    @gear.price = params[:gear][:price]
    @gear.image_url = params[:gear][:image_url]

    if @gear.save
      redirect_to gears_url
    else
      render 'new'
    end
  end

  def destroy
    @gear = Gear.find_by(:id => params[:id])
    @gear.destroy
    redirect_to gears_url
  end
end
