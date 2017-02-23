class AccomodationPhotosController < ApplicationController
  def index
    @q = AccomodationPhoto.ransack(params[:q])
    @accomodation_photos = @q.result(:distinct => true).includes(:accommodation).page(params[:page]).per(10)

    render("accomodation_photos/index.html.erb")
  end

  def show
    @accomodation_photo = AccomodationPhoto.find(params[:id])

    render("accomodation_photos/show.html.erb")
  end

  def new
    @accomodation_photo = AccomodationPhoto.new

    render("accomodation_photos/new.html.erb")
  end

  def create
    @accomodation_photo = AccomodationPhoto.new

    @accomodation_photo.accommodation_id = params[:accommodation_id]
    @accomodation_photo.user_id = params[:user_id]
    @accomodation_photo.caption = params[:caption]

    save_status = @accomodation_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accomodation_photos/new", "/create_accomodation_photo"
        redirect_to("/accomodation_photos")
      else
        redirect_back(:fallback_location => "/", :notice => "Accomodation photo created successfully.")
      end
    else
      render("accomodation_photos/new.html.erb")
    end
  end

  def edit
    @accomodation_photo = AccomodationPhoto.find(params[:id])

    render("accomodation_photos/edit.html.erb")
  end

  def update
    @accomodation_photo = AccomodationPhoto.find(params[:id])

    @accomodation_photo.accommodation_id = params[:accommodation_id]
    @accomodation_photo.user_id = params[:user_id]
    @accomodation_photo.caption = params[:caption]

    save_status = @accomodation_photo.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/accomodation_photos/#{@accomodation_photo.id}/edit", "/update_accomodation_photo"
        redirect_to("/accomodation_photos/#{@accomodation_photo.id}", :notice => "Accomodation photo updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Accomodation photo updated successfully.")
      end
    else
      render("accomodation_photos/edit.html.erb")
    end
  end

  def destroy
    @accomodation_photo = AccomodationPhoto.find(params[:id])

    @accomodation_photo.destroy

    if URI(request.referer).path == "/accomodation_photos/#{@accomodation_photo.id}"
      redirect_to("/", :notice => "Accomodation photo deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Accomodation photo deleted.")
    end
  end
end
