defmodule RocketmealWeb.Router do
  use RocketmealWeb, :router

  alias RocketmealWeb.Plugs.UUIDChecker

  pipeline :api do
    plug :accepts, ["json"]
    plug UUIDChecker
  end

  scope "/api", RocketmealWeb do
    pipe_through :api

    resources "/meals", MealController, except: [:new, :edit]
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: RocketmealWeb.Telemetry
    end
  end
end
