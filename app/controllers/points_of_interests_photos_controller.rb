class PointsOfInterestsPhotosController < ApplicationController
  def index
    @points_of_interests_photos = PointsOfInterestsPhoto.page(params[:page]).per(10)

    render("points_of_interests_photos/index.html.erb")
  end

  def show
    @points_of_interests_photo = PointsOfInterestsPhoto.find(params[:id])

    render("points_of_interests_photos/show.html.erb")
  end

  def new
    @points_of_interests_photo = PointsOfInterestsPhoto.new

    render("points_of_interests_photos/new.html.erb")
  end

  def create
    @points_of_interests_photo = PointsOfInterestsPhoto.new

    @points_of_interests_photo.points_of_interest_id = params[:points_of_interest_id]
    @points_of_interests_photo.user_id = params[:user_id]
    @points_of_interests_photo.caption = params[:caption]

    save_status = @points_of_interests_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/points_of_interests_photos/new", "/create_points_of_interests_photo"
        redirect_to("/points_of_interests_photos")
      else
        redirect_back(:fallback_location => "/", :notice => "Points of interests photo created successfully.")
      end
    else
      render("points_of_interests_photos/new.html.erb")
    end
  end

  def edit
    @points_of_interests_photo = PointsOfInterestsPhoto.find(params[:id])

    render("points_of_interests_photos/edit.html.erb")
  end

  def update
    @points_of_interests_photo = PointsOfInterestsPhoto.find(params[:id])

    @points_of_interests_photo.points_of_interest_id = params[:points_of_interest_id]
    @points_of_interests_photo.user_id = params[:user_id]
    @points_of_interests_photo.caption = params[:caption]

    save_status = @points_of_interests_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/points_of_interests_photos/#{@points_of_interests_photo.id}/edit", "/update_points_of_interests_photo"
        redirect_to("/points_of_interests_photos/#{@points_of_interests_photo.id}", :notice => "Points of interests photo updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Points of interests photo updated successfully.")
      end
    else
      render("points_of_interests_photos/edit.html.erb")
    end
  end

  def destroy
    @points_of_interests_photo = PointsOfInterestsPhoto.find(params[:id])

    @points_of_interests_photo.destroy

    if URI(request.referer).path == "/points_of_interests_photos/#{@points_of_interests_photo.id}"
      redirect_to("/", :notice => "Points of interests photo deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Points of interests photo deleted.")
    end
  end
end
