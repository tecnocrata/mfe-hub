defmodule App.Catalog do
  @moduledoc """
  The Catalog context.
  """

  import Ecto.Query, warn: false
  alias App.Repo

  alias App.Catalog.Mfe

  @doc """
  Returns the list of mfes.

  ## Examples

      iex> list_mfes()
      [%Mfe{}, ...]

  """
  def list_mfes do
    Repo.all(Mfe)
  end

  def get_mfe_by_version(name, version, tenant) do
    query = from v in Mfe_Ver, join: m in Mfe, on: m.id == v.mfes_id, 
            where: v.name == ^name and v.tenant== ^tenant and v.version == ^version,
            select: m
    Repo.one (query)

    # Mfe_Ver
    # |> where([v], v.name == ^name and v.tenant== ^tenant and v.version == ^version)
    # |> join(:inner, [v],  m in Mfe, on: m.id == v.mfes_id)
    # |> select([m],m)
    # |> Repo.one 

  end

  @doc """
  Gets a single mfe.

  Raises `Ecto.NoResultsError` if the Mfe does not exist.

  ## Examples

      iex> get_mfe!(123)
      %Mfe{}

      iex> get_mfe!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mfe!(id), do: Repo.get!(Mfe, id)

  @doc """
  Creates a mfe.

  ## Examples

      iex> create_mfe(%{field: value})
      {:ok, %Mfe{}}

      iex> create_mfe(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mfe(attrs \\ %{}) do
    %Mfe{}
    |> Mfe.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mfe.

  ## Examples

      iex> update_mfe(mfe, %{field: new_value})
      {:ok, %Mfe{}}

      iex> update_mfe(mfe, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mfe(%Mfe{} = mfe, attrs) do
    mfe
    |> Mfe.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mfe.

  ## Examples

      iex> delete_mfe(mfe)
      {:ok, %Mfe{}}

      iex> delete_mfe(mfe)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mfe(%Mfe{} = mfe) do
    Repo.delete(mfe)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mfe changes.

  ## Examples

      iex> change_mfe(mfe)
      %Ecto.Changeset{data: %Mfe{}}

  """
  def change_mfe(%Mfe{} = mfe, attrs \\ %{}) do
    Mfe.changeset(mfe, attrs)
  end


  alias App.Catalog.Mfe_Ver

  @doc """
  Returns the list of mfe_vers.

  ## Examples

      iex> list_mfe_vers()
      [%Mfe_Ver{}, ...]

  """
  def list_mfe_vers do
    Repo.all(Mfe_Ver)
  end

  @doc """
  Gets a single mfe__ver.

  Raises `Ecto.NoResultsError` if the Mfe  ver does not exist.

  ## Examples

      iex> get_mfe__ver!(123)
      %Mfe_Ver{}

      iex> get_mfe__ver!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mfe__ver!(id), do: Repo.get!(Mfe_Ver, id)


  def get_mfe_by_version2(name, version, tenant) do
    query = from v in Mfe_Ver, join: m in Mfe, on: m.id == v.mfes_id, 
            where: v.name == ^name and v.tenant== ^tenant and v.version == ^version,
            select: m
    Repo.one (query)

    # Mfe_Ver
    # |> where([v], v.name == ^name and v.tenant== ^tenant and v.version == ^version)
    # |> join(:inner, [v],  m in Mfe, on: m.id == v.mfes_id)
    # |> select([m],m)
    # |> Repo.one 

  end

  @doc """
  Creates a mfe__ver.

  ## Examples

      iex> create_mfe__ver(%{field: value})
      {:ok, %Mfe_Ver{}}

      iex> create_mfe__ver(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mfe__ver(attrs \\ %{}) do
    %Mfe_Ver{}
    |> Mfe_Ver.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mfe__ver.

  ## Examples

      iex> update_mfe__ver(mfe__ver, %{field: new_value})
      {:ok, %Mfe_Ver{}}

      iex> update_mfe__ver(mfe__ver, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mfe__ver(%Mfe_Ver{} = mfe__ver, attrs) do
    mfe__ver
    |> Mfe_Ver.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mfe__ver.

  ## Examples

      iex> delete_mfe__ver(mfe__ver)
      {:ok, %Mfe_Ver{}}

      iex> delete_mfe__ver(mfe__ver)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mfe__ver(%Mfe_Ver{} = mfe__ver) do
    Repo.delete(mfe__ver)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mfe__ver changes.

  ## Examples

      iex> change_mfe__ver(mfe__ver)
      %Ecto.Changeset{data: %Mfe_Ver{}}

  """
  def change_mfe__ver(%Mfe_Ver{} = mfe__ver, attrs \\ %{}) do
    Mfe_Ver.changeset(mfe__ver, attrs)
  end

  

  alias App.Catalog.MfeConfig

  @doc """
  Returns the list of mfeconfigs.

  ## Examples

      iex> list_mfeconfigs()
      [%MfeConfig{}, ...]

  """
  def list_mfeconfigs do
    Repo.all(MfeConfig)
  end

  @doc """
  Gets a single mfe_config.

  Raises `Ecto.NoResultsError` if the Mfe config does not exist.

  ## Examples

      iex> get_mfe_config!(123)
      %MfeConfig{}

      iex> get_mfe_config!(456)
      ** (Ecto.NoResultsError)

  """
  def get_mfe_config!(id), do: Repo.get!(MfeConfig, id)

  @doc """
  Creates a mfe_config.

  ## Examples

      iex> create_mfe_config(%{field: value})
      {:ok, %MfeConfig{}}

      iex> create_mfe_config(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_mfe_config(attrs \\ %{}) do
    %MfeConfig{}
    |> MfeConfig.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a mfe_config.

  ## Examples

      iex> update_mfe_config(mfe_config, %{field: new_value})
      {:ok, %MfeConfig{}}

      iex> update_mfe_config(mfe_config, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_mfe_config(%MfeConfig{} = mfe_config, attrs) do
    mfe_config
    |> MfeConfig.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a mfe_config.

  ## Examples

      iex> delete_mfe_config(mfe_config)
      {:ok, %MfeConfig{}}

      iex> delete_mfe_config(mfe_config)
      {:error, %Ecto.Changeset{}}

  """
  def delete_mfe_config(%MfeConfig{} = mfe_config) do
    Repo.delete(mfe_config)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking mfe_config changes.

  ## Examples

      iex> change_mfe_config(mfe_config)
      %Ecto.Changeset{data: %MfeConfig{}}

  """
  def change_mfe_config(%MfeConfig{} = mfe_config, attrs \\ %{}) do
    MfeConfig.changeset(mfe_config, attrs)
  end

  def getcurrenMfeVersion(name) do
    query = from c in MfeConfig,
            where: c.name == ^name,
            select: c
    item = Repo.one (query)
    item.active_version
  end
end
