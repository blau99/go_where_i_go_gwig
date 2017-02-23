class PointsOfInterestsFavoritesController < ApplicationController
  before_action :current_user_must_be_points_of_interests_favorite_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_points_of_interests_favorite_user
    points_of_interests_favorite = PointsOfInterestsFavorite.find(params[:id])

    unless current_user == points_of_interests_favorite.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = PointsOfInterestsFavorite.ransack(params[:q])
    @points_of_interests_favorites = @q.result(:distinct => true).includes(:user, :points_of_interest).page(params[:page]).per(10)

    render("points_of_interests_favorites/index.html.erb")
  end

  def show
    @points_of_interests_favorite = PointsOfInterestsFavorite.find(params[:id])

    render("points_of_interests_favorites/show.html.erb")
  end

  def new
    @points_of_interests_favorite = PointsOfInterestsFavorite.new

    render("points_of_interests_favorites/new.html.erb")
  end

  def create
    @points_of_interests_favorite = PointsOfInterestsFavorite.new

    @points_of_interests_favorite.points_of_interest_id = params[:points_of_interest_id]
    @points_of_interests_favorite.user_id = params[:user_id]

    save_status = @points_of_interests_favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/points_of_interests_favorites/new", "/create_points_of_interests_favorite"
        redirect_to("/points_of_interests_favorites")
      else
        redirect_back(:fallback_location => "/", :notice => "Points of interests favorite created successfully.")
      end
    else
      render("points_of_interests_favorites/new.html.erb")
    end
  end

  def edit
    @points_of_interests_favorite = PointsOfInterestsFavorite.find(params[:id])

    render("points_of_interests_favorites/edit.html.erb")
  end

  def update
    @points_of_interests_favorite = PointsOfInterestsFavorite.find(params[:id])

    @points_of_interests_favorite.points_of_interest_id = params[:points_of_interest_id]
    @points_of_interests_favorite.user_id = params[:user_id]

    save_status = @points_of_interests_favorite.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/points_of_interests_favorites/#{@points_of_interests_favorite.id}/edit", "/update_points_of_interests_favorite"
        redirect_to("/points_of_interests_favorites/#{@points_of_interests_favorite.id}", :notice => "Points of interests favorite updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Points of interests favorite updated successfully.")
      end
    else
      render("points_of_interests_favorites/edit.html.erb")
    end
  end

  def destroy
    @points_of_interests_favorite = PointsOfInterestsFavorite.find(params[:id])

    @points_of_interests_favorite.destroy

    if URI(request.referer).path == "/points_of_interests_favorites/#{@points_of_interests_favorite.id}"
      redirect_to("/", :notice => "Points of interests favorite deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Points of interests favorite deleted.")
    end
  end
end
