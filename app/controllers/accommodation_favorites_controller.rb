class AccommodationFavoritesController < ApplicationController
  before_action :current_user_must_be_accommodation_favorite_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_accommodation_favorite_user
    accommodation_favorite = AccommodationFavorite.find(params[:id])

    unless current_user == accommodation_favorite.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @accommodation_favorites = AccommodationFavorite.page(params[:page]).per(10)

    render("accommodation_favorites/index.html.erb")
  end

  def show
    @accommodation_favorite = AccommodationFavorite.find(params[:id])

    render("accommodation_favorites/show.html.erb")
  end

  def new
    @accommodation_favorite = AccommodationFavorite.new

    render("accommodation_favorites/new.html.erb")
  end

  def create
    @accommodation_favorite = AccommodationFavorite.new

    @accommodation_favorite.accommodation_id = params[:accommodation_id]
    @accommodation_favorite.user_id = params[:user_id]

    save_status = @accommodation_favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accommodation_favorites/new", "/create_accommodation_favorite"
        redirect_to("/accommodation_favorites")
      else
        redirect_back(:fallback_location => "/", :notice => "Accommodation favorite created successfully.")
      end
    else
      render("accommodation_favorites/new.html.erb")
    end
  end

  def edit
    @accommodation_favorite = AccommodationFavorite.find(params[:id])

    render("accommodation_favorites/edit.html.erb")
  end

  def update
    @accommodation_favorite = AccommodationFavorite.find(params[:id])

    @accommodation_favorite.accommodation_id = params[:accommodation_id]
    @accommodation_favorite.user_id = params[:user_id]

    save_status = @accommodation_favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accommodation_favorites/#{@accommodation_favorite.id}/edit", "/update_accommodation_favorite"
        redirect_to("/accommodation_favorites/#{@accommodation_favorite.id}", :notice => "Accommodation favorite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Accommodation favorite updated successfully.")
      end
    else
      render("accommodation_favorites/edit.html.erb")
    end
  end

  def destroy
    @accommodation_favorite = AccommodationFavorite.find(params[:id])

    @accommodation_favorite.destroy

    if URI(request.referer).path == "/accommodation_favorites/#{@accommodation_favorite.id}"
      redirect_to("/", :notice => "Accommodation favorite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Accommodation favorite deleted.")
    end
  end
end
