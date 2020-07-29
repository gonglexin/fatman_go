defmodule FatmanGoWeb.Router do
  use FatmanGoWeb, :router
  import Plug.BasicAuth
  import Phoenix.LiveDashboard.Router

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

  scope "/", FatmanGoWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  pipeline :admins_only do
    plug :basic_auth, username: "admin", password: "admin"
  end

  scope "/" do
    pipe_through [:browser, :admins_only]
    live_dashboard "/dashboard", metrics: FatmanGoWeb.Telemetry
  end
end
