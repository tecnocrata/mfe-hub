defmodule App.Repo.Migrations.CreateMfeconfigs do
  use Ecto.Migration

  def change do
    create table(:mfeconfigs) do
      add :name, :string
      add :active_version, :string

      timestamps()
    end

  end
end
