defmodule LaundryManagerWeb.Router do
  use LaundryManagerWeb, :router

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

  scope "/", LaundryManagerWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", LaundryManagerWeb do
    pipe_through :api

    scope "/laundry" do
      resources "/kilogram", KilogramLaundryTransactionController, except: [:edit, :new]
      resources "/unit", UnitLaundryTransactionController, except: [:edit, :new]
      resources "/types", LaundryTypeController, except: [:edit, :new]
    end
    scope "/statistic" do
      get "/kilogram", StatisticLaundryTransactionController, :kilogramStatistic
      get "/unit", StatisticLaundryTransactionController, :unitStatistic
    end
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: LaundryManagerWeb.Telemetry
    end
  end
end
