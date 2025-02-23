defmodule GamificationWeb.Router do
  use GamificationWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_live_flash)
    plug(:put_root_layout, html: {GamificationWeb.Layouts, :root})
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", GamificationWeb do
    pipe_through(:browser)

    get("/", PageController, :home)
    live("/players", PlayerLive.Index, :index)
    live("/players/new", PlayerLive.Index, :new)
    live("/players/:id/edit", PlayerLive.Index, :edit)
    live("/players/:id", PlayerLive.Show, :show)
    live("/players/:id/show/edit", PlayerLive.Show, :edit)
    live("/quests", QuestLive.Index, :index)
    live("/quests/new", QuestLive.Index, :new)
    live("/quests/:id/edit", QuestLive.Index, :edit)
    live("/quests/:id", QuestLive.Show, :show)
    live("/quests/:id/show/edit", QuestLive.Show, :edit)
    live("/active_quests", ActiveQuestLive.Index, :index)
    live("/active_quests/new", ActiveQuestLive.Index, :new)
    live("/active_quests/:id/edit", ActiveQuestLive.Index, :edit)
    live("/active_quests/:id", ActiveQuestLive.Show, :show)
    live("/active_quests/:id/show/edit", ActiveQuestLive.Show, :edit)
    live("/rewards", RewardLive.Index, :index)
    live("/rewards/new", RewardLive.Index, :new)
    live("/rewards/:id/edit", RewardLive.Index, :edit)
    live("/rewards/:id", RewardLive.Show, :show)
    live("/rewards/:id/show/edit", RewardLive.Show, :edit)
    live("/achievements", AchievementLive.Index, :index)
    live("/achievements/new", AchievementLive.Index, :new)
    live("/achievements/:id/edit", AchievementLive.Index, :edit)
    live("/achievements/:id", AchievementLive.Show, :show)
    live("/achievements/:id/show/edit", AchievementLive.Show, :edit)
    live("/players_achievements", PlayerAchievementLive.Index, :index)
    live("/players_achievements/new", PlayerAchievementLive.Index, :new)
    live("/players_achievements/:id/edit", PlayerAchievementLive.Index, :edit)
    live("/players_achievements/:id", PlayerAchievementLive.Show, :show)
    live("/players_achievements/:id/show/edit", PlayerAchievementLive.Show, :edit)
    live("/milestones", MilestoneLive.Index, :index)
    live("/milestones/new", MilestoneLive.Index, :new)
    live("/milestones/:id/edit", MilestoneLive.Index, :edit)
    live("/milestones/:id", MilestoneLive.Show, :show)
    live("/milestones/:id/show/edit", MilestoneLive.Show, :edit)
    live "/quests_rewards", QuestRewardLive.Index, :index
    live "/quests_rewards/new", QuestRewardLive.Index, :new
    live "/quests_rewards/:id/edit", QuestRewardLive.Index, :edit
    live "/quests_rewards/:id", QuestRewardLive.Show, :show
    live "/quests_rewards/:id/show/edit", QuestRewardLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", GamificationWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:gamification, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through(:browser)

      live_dashboard("/dashboard", metrics: GamificationWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end
  end
end
