defmodule BuckcalcWeb.Router do
  use BuckcalcWeb.Web, :router

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

  scope "/", BuckcalcWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", BuckcalcWeb do
     pipe_through :api
     resources "/users", UserController, except: [:new, :edit]
     resources "/questions", QuestionController, except: [:new, :edit]
  end
end
