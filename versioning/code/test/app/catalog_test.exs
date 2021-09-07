defmodule App.CatalogTest do
  use App.DataCase

  alias App.Catalog

  describe "mfes" do
    alias App.Catalog.Mfe

    @valid_attrs %{name: "some name", semver: "some semver", tenant: "some tenant", urladdress: "some urladdress"}
    @update_attrs %{name: "some updated name", semver: "some updated semver", tenant: "some updated tenant", urladdress: "some updated urladdress"}
    @invalid_attrs %{name: nil, semver: nil, tenant: nil, urladdress: nil}

    def mfe_fixture(attrs \\ %{}) do
      {:ok, mfe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_mfe()

      mfe
    end

    test "list_mfes/0 returns all mfes" do
      mfe = mfe_fixture()
      assert Catalog.list_mfes() == [mfe]
    end

    test "get_mfe!/1 returns the mfe with given id" do
      mfe = mfe_fixture()
      assert Catalog.get_mfe!(mfe.id) == mfe
    end

    test "create_mfe/1 with valid data creates a mfe" do
      assert {:ok, %Mfe{} = mfe} = Catalog.create_mfe(@valid_attrs)
      assert mfe.name == "some name"
      assert mfe.semver == "some semver"
      assert mfe.tenant == "some tenant"
      assert mfe.urladdress == "some urladdress"
    end

    test "create_mfe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_mfe(@invalid_attrs)
    end

    test "update_mfe/2 with valid data updates the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{} = mfe} = Catalog.update_mfe(mfe, @update_attrs)
      assert mfe.name == "some updated name"
      assert mfe.semver == "some updated semver"
      assert mfe.tenant == "some updated tenant"
      assert mfe.urladdress == "some updated urladdress"
    end

    test "update_mfe/2 with invalid data returns error changeset" do
      mfe = mfe_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_mfe(mfe, @invalid_attrs)
      assert mfe == Catalog.get_mfe!(mfe.id)
    end

    test "delete_mfe/1 deletes the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{}} = Catalog.delete_mfe(mfe)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_mfe!(mfe.id) end
    end

    test "change_mfe/1 returns a mfe changeset" do
      mfe = mfe_fixture()
      assert %Ecto.Changeset{} = Catalog.change_mfe(mfe)
    end
  end

  describe "mfe_vers" do
    alias App.Catalog.Mfe_Ver

    @valid_attrs %{name: "some name", tenant: "some tenant", version: "some version"}
    @update_attrs %{name: "some updated name", tenant: "some updated tenant", version: "some updated version"}
    @invalid_attrs %{name: nil, tenant: nil, version: nil}

    def mfe__ver_fixture(attrs \\ %{}) do
      {:ok, mfe__ver} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_mfe__ver()

      mfe__ver
    end

    test "list_mfe_vers/0 returns all mfe_vers" do
      mfe__ver = mfe__ver_fixture()
      assert Catalog.list_mfe_vers() == [mfe__ver]
    end

    test "get_mfe__ver!/1 returns the mfe__ver with given id" do
      mfe__ver = mfe__ver_fixture()
      assert Catalog.get_mfe__ver!(mfe__ver.id) == mfe__ver
    end

    test "create_mfe__ver/1 with valid data creates a mfe__ver" do
      assert {:ok, %Mfe_Ver{} = mfe__ver} = Catalog.create_mfe__ver(@valid_attrs)
      assert mfe__ver.name == "some name"
      assert mfe__ver.tenant == "some tenant"
      assert mfe__ver.version == "some version"
    end

    test "create_mfe__ver/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_mfe__ver(@invalid_attrs)
    end

    test "update_mfe__ver/2 with valid data updates the mfe__ver" do
      mfe__ver = mfe__ver_fixture()
      assert {:ok, %Mfe_Ver{} = mfe__ver} = Catalog.update_mfe__ver(mfe__ver, @update_attrs)
      assert mfe__ver.name == "some updated name"
      assert mfe__ver.tenant == "some updated tenant"
      assert mfe__ver.version == "some updated version"
    end

    test "update_mfe__ver/2 with invalid data returns error changeset" do
      mfe__ver = mfe__ver_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_mfe__ver(mfe__ver, @invalid_attrs)
      assert mfe__ver == Catalog.get_mfe__ver!(mfe__ver.id)
    end

    test "delete_mfe__ver/1 deletes the mfe__ver" do
      mfe__ver = mfe__ver_fixture()
      assert {:ok, %Mfe_Ver{}} = Catalog.delete_mfe__ver(mfe__ver)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_mfe__ver!(mfe__ver.id) end
    end

    test "change_mfe__ver/1 returns a mfe__ver changeset" do
      mfe__ver = mfe__ver_fixture()
      assert %Ecto.Changeset{} = Catalog.change_mfe__ver(mfe__ver)
    end
  end

  describe "fes" do
    alias App.Catalog.Mfe

    @valid_attrs %{name: "some name", "no-context": "some no-context", "no-schema": "some no-schema", semver: "some semver", tenant: "some tenant", urladdress: "some urladdress", "—": "some —"}
    @update_attrs %{name: "some updated name", "no-context": "some updated no-context", "no-schema": "some updated no-schema", semver: "some updated semver", tenant: "some updated tenant", urladdress: "some updated urladdress", "—": "some updated —"}
    @invalid_attrs %{name: nil, "no-context": nil, "no-schema": nil, semver: nil, tenant: nil, urladdress: nil, "—": nil}

    def mfe_fixture(attrs \\ %{}) do
      {:ok, mfe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_mfe()

      mfe
    end

    test "list_fes/0 returns all fes" do
      mfe = mfe_fixture()
      assert Catalog.list_fes() == [mfe]
    end

    test "get_mfe!/1 returns the mfe with given id" do
      mfe = mfe_fixture()
      assert Catalog.get_mfe!(mfe.id) == mfe
    end

    test "create_mfe/1 with valid data creates a mfe" do
      assert {:ok, %Mfe{} = mfe} = Catalog.create_mfe(@valid_attrs)
      assert mfe.name == "some name"
      assert mfe.no-context == "some no-context"
      assert mfe.no-schema == "some no-schema"
      assert mfe.semver == "some semver"
      assert mfe.tenant == "some tenant"
      assert mfe.urladdress == "some urladdress"
      assert mfe.— == "some —"
    end

    test "create_mfe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_mfe(@invalid_attrs)
    end

    test "update_mfe/2 with valid data updates the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{} = mfe} = Catalog.update_mfe(mfe, @update_attrs)
      assert mfe.name == "some updated name"
      assert mfe.no-context == "some updated no-context"
      assert mfe.no-schema == "some updated no-schema"
      assert mfe.semver == "some updated semver"
      assert mfe.tenant == "some updated tenant"
      assert mfe.urladdress == "some updated urladdress"
      assert mfe.— == "some updated —"
    end

    test "update_mfe/2 with invalid data returns error changeset" do
      mfe = mfe_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_mfe(mfe, @invalid_attrs)
      assert mfe == Catalog.get_mfe!(mfe.id)
    end

    test "delete_mfe/1 deletes the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{}} = Catalog.delete_mfe(mfe)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_mfe!(mfe.id) end
    end

    test "change_mfe/1 returns a mfe changeset" do
      mfe = mfe_fixture()
      assert %Ecto.Changeset{} = Catalog.change_mfe(mfe)
    end
  end

  describe "mfes" do
    alias App.Catalog.Mfe

    @valid_attrs %{name: "some name", "no-context": "some no-context", "no-schema": "some no-schema", semver: "some semver", tenant: "some tenant", urladdress: "some urladdress", "—": "some —"}
    @update_attrs %{name: "some updated name", "no-context": "some updated no-context", "no-schema": "some updated no-schema", semver: "some updated semver", tenant: "some updated tenant", urladdress: "some updated urladdress", "—": "some updated —"}
    @invalid_attrs %{name: nil, "no-context": nil, "no-schema": nil, semver: nil, tenant: nil, urladdress: nil, "—": nil}

    def mfe_fixture(attrs \\ %{}) do
      {:ok, mfe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_mfe()

      mfe
    end

    test "list_mfes/0 returns all mfes" do
      mfe = mfe_fixture()
      assert Catalog.list_mfes() == [mfe]
    end

    test "get_mfe!/1 returns the mfe with given id" do
      mfe = mfe_fixture()
      assert Catalog.get_mfe!(mfe.id) == mfe
    end

    test "create_mfe/1 with valid data creates a mfe" do
      assert {:ok, %Mfe{} = mfe} = Catalog.create_mfe(@valid_attrs)
      assert mfe.name == "some name"
      assert mfe.no-context == "some no-context"
      assert mfe.no-schema == "some no-schema"
      assert mfe.semver == "some semver"
      assert mfe.tenant == "some tenant"
      assert mfe.urladdress == "some urladdress"
      assert mfe.— == "some —"
    end

    test "create_mfe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_mfe(@invalid_attrs)
    end

    test "update_mfe/2 with valid data updates the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{} = mfe} = Catalog.update_mfe(mfe, @update_attrs)
      assert mfe.name == "some updated name"
      assert mfe.no-context == "some updated no-context"
      assert mfe.no-schema == "some updated no-schema"
      assert mfe.semver == "some updated semver"
      assert mfe.tenant == "some updated tenant"
      assert mfe.urladdress == "some updated urladdress"
      assert mfe.— == "some updated —"
    end

    test "update_mfe/2 with invalid data returns error changeset" do
      mfe = mfe_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_mfe(mfe, @invalid_attrs)
      assert mfe == Catalog.get_mfe!(mfe.id)
    end

    test "delete_mfe/1 deletes the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{}} = Catalog.delete_mfe(mfe)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_mfe!(mfe.id) end
    end

    test "change_mfe/1 returns a mfe changeset" do
      mfe = mfe_fixture()
      assert %Ecto.Changeset{} = Catalog.change_mfe(mfe)
    end
  end

  describe "mfes" do
    alias App.Catalog.Mfe

    @valid_attrs %{name: "some name", semver: "some semver", tenant: "some tenant", urladdress: "some urladdress", "—-no-context": "some —-no-context"}
    @update_attrs %{name: "some updated name", semver: "some updated semver", tenant: "some updated tenant", urladdress: "some updated urladdress", "—-no-context": "some updated —-no-context"}
    @invalid_attrs %{name: nil, semver: nil, tenant: nil, urladdress: nil, "—-no-context": nil}

    def mfe_fixture(attrs \\ %{}) do
      {:ok, mfe} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalog.create_mfe()

      mfe
    end

    test "list_mfes/0 returns all mfes" do
      mfe = mfe_fixture()
      assert Catalog.list_mfes() == [mfe]
    end

    test "get_mfe!/1 returns the mfe with given id" do
      mfe = mfe_fixture()
      assert Catalog.get_mfe!(mfe.id) == mfe
    end

    test "create_mfe/1 with valid data creates a mfe" do
      assert {:ok, %Mfe{} = mfe} = Catalog.create_mfe(@valid_attrs)
      assert mfe.name == "some name"
      assert mfe.semver == "some semver"
      assert mfe.tenant == "some tenant"
      assert mfe.urladdress == "some urladdress"
      assert mfe.—-no-context == "some —-no-context"
    end

    test "create_mfe/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalog.create_mfe(@invalid_attrs)
    end

    test "update_mfe/2 with valid data updates the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{} = mfe} = Catalog.update_mfe(mfe, @update_attrs)
      assert mfe.name == "some updated name"
      assert mfe.semver == "some updated semver"
      assert mfe.tenant == "some updated tenant"
      assert mfe.urladdress == "some updated urladdress"
      assert mfe.—-no-context == "some updated —-no-context"
    end

    test "update_mfe/2 with invalid data returns error changeset" do
      mfe = mfe_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalog.update_mfe(mfe, @invalid_attrs)
      assert mfe == Catalog.get_mfe!(mfe.id)
    end

    test "delete_mfe/1 deletes the mfe" do
      mfe = mfe_fixture()
      assert {:ok, %Mfe{}} = Catalog.delete_mfe(mfe)
      assert_raise Ecto.NoResultsError, fn -> Catalog.get_mfe!(mfe.id) end
    end

    test "change_mfe/1 returns a mfe changeset" do
      mfe = mfe_fixture()
      assert %Ecto.Changeset{} = Catalog.change_mfe(mfe)
    end
  end
end
