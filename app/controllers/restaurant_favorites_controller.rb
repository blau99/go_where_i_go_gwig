class RestaurantFavoritesController < ApplicationController
  def index
    @restaurant_favorites = RestaurantFavorite.all

    render("restaurant_favorites/index.html.erb")
  end

  def show
    @restaurant_favorite = RestaurantFavorite.find(params[:id])

    render("restaurant_favorites/show.html.erb")
  end

  def new
    @restaurant_favorite = RestaurantFavorite.new

    render("restaurant_favorites/new.html.erb")
  end

  def create
    @restaurant_favorite = RestaurantFavorite.new

    @restaurant_favorite.restaurant_id = params[:restaurant_id]
    @restaurant_favorite.user_id = params[:user_id]

    save_status = @restaurant_favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurant_favorites/new", "/create_restaurant_favorite"
        redirect_to("/restaurant_favorites")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurant favorite created successfully.")
      end
    else
      render("restaurant_favorites/new.html.erb")
    end
  end

  def edit
    @restaurant_favorite = RestaurantFavorite.find(params[:id])

    render("restaurant_favorites/edit.html.erb")
  end

  def update
    @restaurant_favorite = RestaurantFavorite.find(params[:id])

    @restaurant_favorite.restaurant_id = params[:restaurant_id]
    @restaurant_favorite.user_id = params[:user_id]

    save_status = @restaurant_favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/restaurant_favorites/#{@restaurant_favorite.id}/edit", "/update_restaurant_favorite"
        redirect_to("/restaurant_favorites/#{@restaurant_favorite.id}", :notice => "Restaurant favorite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Restaurant favorite updated successfully.")
      end
    else
      render("restaurant_favorites/edit.html.erb")
    end
  end

  def destroy
    @restaurant_favorite = RestaurantFavorite.find(params[:id])

    @restaurant_favorite.destroy

    if URI(request.referer).path == "/restaurant_favorites/#{@restaurant_favorite.id}"
      redirect_to("/", :notice => "Restaurant favorite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Restaurant favorite deleted.")
    end
  end
end
