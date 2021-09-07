defmodule App.Repo.Migrations.CreateMfes do
  use Ecto.Migration

  def change do
    create table(:mfes) do
      add :name, :string
      add :semver, :string
      add :tenant, :string
      add :urladdress, :string

      timestamps()
    end

  end
end
