defmodule Gamification.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :email, :string
      add :score, :integer
      add :level, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
