Rails.application.routes.draw do
  # Routes for the Points_of_interest resource:
  # CREATE
  get "/points_of_interests/new", :controller => "points_of_interests", :action => "new"
  post "/create_points_of_interest", :controller => "points_of_interests", :action => "create"

  # READ
  get "/points_of_interests", :controller => "points_of_interests", :action => "index"
  get "/points_of_interests/:id", :controller => "points_of_interests", :action => "show"

  # UPDATE
  get "/points_of_interests/:id/edit", :controller => "points_of_interests", :action => "edit"
  post "/update_points_of_interest/:id", :controller => "points_of_interests", :action => "update"

  # DELETE
  get "/delete_points_of_interest/:id", :controller => "points_of_interests", :action => "destroy"
  #------------------------------

  # Routes for the Restaurant resource:
  # CREATE
  get "/restaurants/new", :controller => "restaurants", :action => "new"
  post "/create_restaurant", :controller => "restaurants", :action => "create"

  # READ
  get "/restaurants", :controller => "restaurants", :action => "index"
  get "/restaurants/:id", :controller => "restaurants", :action => "show"

  # UPDATE
  get "/restaurants/:id/edit", :controller => "restaurants", :action => "edit"
  post "/update_restaurant/:id", :controller => "restaurants", :action => "update"

  # DELETE
  get "/delete_restaurant/:id", :controller => "restaurants", :action => "destroy"
  #------------------------------

  # Routes for the Friend_request resource:
  # CREATE
  get "/friend_requests/new", :controller => "friend_requests", :action => "new"
  post "/create_friend_request", :controller => "friend_requests", :action => "create"

  # READ
  get "/friend_requests", :controller => "friend_requests", :action => "index"
  get "/friend_requests/:id", :controller => "friend_requests", :action => "show"

  # UPDATE
  get "/friend_requests/:id/edit", :controller => "friend_requests", :action => "edit"
  post "/update_friend_request/:id", :controller => "friend_requests", :action => "update"

  # DELETE
  get "/delete_friend_request/:id", :controller => "friend_requests", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
