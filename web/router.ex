defmodule BuckcalcApi.Router do
  use BuckcalcApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BuckcalcApi do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", BuckcalcApi do
     pipe_through :api
     resources "/users", UserController, except: [:new, :edit]
     
     get "/questions/:user_id", QuestionController, :index
     post "/questions/:user_id", QuestionController, :create
  end
end
