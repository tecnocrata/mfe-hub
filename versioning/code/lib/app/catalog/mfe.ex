defmodule App.Catalog.Mfe do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mfes" do
    field :name, :string
    field :semver, :string
    field :tenant, :string
    field :urladdress, :string

    timestamps()
  end

  @doc false
  def changeset(mfe, attrs) do
    mfe
    |> cast(attrs, [:name, :semver, :tenant, :urladdress])
    |> validate_required([:name, :semver, :tenant, :urladdress])
  end
end
