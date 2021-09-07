defmodule App.Catalog.Mfe_Ver do
  use Ecto.Schema
  import Ecto.Changeset

  schema "mfe_vers" do
    field :name, :string
    field :tenant, :string
    field :version, :string
    field :mfes_id, :id

    timestamps()
  end

  @doc false
  def changeset(mfe__ver, attrs) do
    mfe__ver
    |> cast(attrs, [:name, :version, :tenant])
    |> validate_required([:name, :version, :tenant])
  end
end
