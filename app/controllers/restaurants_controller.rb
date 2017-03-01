class RestaurantsController < ApplicationController
  before_action :current_user_must_be_restaurant_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_restaurant_user
    restaurant = Restaurant.find(params[:id])

    unless current_user == restaurant.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Restaurant.ransack(params[:q])
    @restaurants = @q.result(:distinct => true).includes(:user, :best_dishes, :favorites, :photos).page(params[:page]).per(10)
    @location_hash = Gmaps4rails.build_markers(@restaurants.where.not(:address_latitude => nil)) do |restaurant, marker|
      marker.lat restaurant.address_latitude
      marker.lng restaurant.address_longitude
      marker.infowindow "<h5><a href='/restaurants/#{restaurant.id}'>#{restaurant.name}</a></h5><small>#{restaurant.address_formatted_address}</small>"
    end

    render("restaurants/index.html.erb")
  end

  def show
    @photo = Photo.new
    @favorite = Favorite.new
    @best_dish = BestDish.new
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/show.html.erb")
  end

  def new
    @restaurant = Restaurant.new

    render("restaurants/new.html.erb")
  end

  def create
    @restaurant = Restaurant.new

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.image = params[:image]
    @restaurant.user_id = params[:user_id]

    save_status = @restaurant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurants/new", "/create_restaurant"
        redirect_to("/restaurants")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurant created successfully.")
      end
    else
      render("restaurants/new.html.erb")
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])

    render("restaurants/edit.html.erb")
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    @restaurant.name = params[:name]
    @restaurant.address = params[:address]
    @restaurant.image = params[:image]
    @restaurant.user_id = params[:user_id]

    save_status = @restaurant.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurants/#{@restaurant.id}/edit", "/update_restaurant"
        redirect_to("/restaurants/#{@restaurant.id}", :notice => "Restaurant updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurant updated successfully.")
      end
    else
      render("restaurants/edit.html.erb")
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])

    @restaurant.destroy

    if URI(request.referer).path == "/restaurants/#{@restaurant.id}"
      redirect_to("/", :notice => "Restaurant deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Restaurant deleted.")
    end
  end
end
