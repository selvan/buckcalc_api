defmodule BuckcalcApi.Router do
  use BuckcalcApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource    
  end

  pipeline :in_email do
  end
  
  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifyHeader
    plug Guardian.Plug.LoadResource    
  end

  scope "/", BuckcalcApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    
    get "/users", UserController, :new
    post "/users", UserController, :create
    get "/users/:id", UserController, :show
    post "/users/:id", UserController, :update
    post "/users/:id/delete", UserController, :delete
    get "/users/:id/activate", UserController, :activate
    get "/users/reset", UserController, :reset
    post "/users/reset", UserController, :reset 
    
    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end

    scope "/", BuckcalcApi do
        pipe_through :in_email 
        post "/in_email", MailController, :in_email
    end    
    

  # Other scopes may use custom stacks.
  scope "/api", BuckcalcApi do
     pipe_through :api
     resources "/users", UserController, except: [:new, :edit]
     
     get "/questions/:user_id", QuestionController, :index
     post "/questions/:user_id", QuestionController, :create
  end
end
