defmodule App.Catalog.MfeConfig do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mfeconfigs" do
    field :active_version, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(mfe_config, attrs) do
    mfe_config
    |> cast(attrs, [:name, :active_version])
    |> validate_required([:name, :active_version])
  end
end
