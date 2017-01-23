defmodule SampleApp.Router do
  use SampleApp.Web, :router

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

  scope "/", SampleApp do
    pipe_through :browser # Use the default browser stack

    get "/", StaticPagesController, :home
    get "/static_pages/home", StaticPagesController, :home
    get "/static_pages/help", StaticPagesController, :help
    get "/static_pages/about", StaticPagesController, :about
    get "/static_pages/contact", StaticPagesController, :contact
  end

  # Other scopes may use custom stacks.
  # scope "/api", SampleApp do
  #   pipe_through :api
  # end
end
