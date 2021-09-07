defmodule App.Repo.Migrations.CreateMfeVers do
  use Ecto.Migration

  def change do
    create table(:mfe_vers) do
      add :name, :string
      add :version, :string
      add :tenant, :string
      add :mfes_id, references(:mfes, on_delete: :nothing)

      timestamps()
    end

    create index(:mfe_vers, [:mfes_id])
  end
end
