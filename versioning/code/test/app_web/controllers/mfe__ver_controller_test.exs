defmodule AppWeb.Mfe_VerControllerTest do
  use AppWeb.ConnCase

  alias App.Catalog
  alias App.Catalog.Mfe_Ver

  @create_attrs %{
    name: "some name",
    tenant: "some tenant",
    version: "some version"
  }
  @update_attrs %{
    name: "some updated name",
    tenant: "some updated tenant",
    version: "some updated version"
  }
  @invalid_attrs %{name: nil, tenant: nil, version: nil}

  def fixture(:mfe__ver) do
    {:ok, mfe__ver} = Catalog.create_mfe__ver(@create_attrs)
    mfe__ver
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all mfe_vers", %{conn: conn} do
      conn = get(conn, Routes.mfe__ver_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create mfe__ver" do
    test "renders mfe__ver when data is valid", %{conn: conn} do
      conn = post(conn, Routes.mfe__ver_path(conn, :create), mfe__ver: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.mfe__ver_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "tenant" => "some tenant",
               "version" => "some version"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.mfe__ver_path(conn, :create), mfe__ver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update mfe__ver" do
    setup [:create_mfe__ver]

    test "renders mfe__ver when data is valid", %{conn: conn, mfe__ver: %Mfe_Ver{id: id} = mfe__ver} do
      conn = put(conn, Routes.mfe__ver_path(conn, :update, mfe__ver), mfe__ver: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.mfe__ver_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "tenant" => "some updated tenant",
               "version" => "some updated version"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, mfe__ver: mfe__ver} do
      conn = put(conn, Routes.mfe__ver_path(conn, :update, mfe__ver), mfe__ver: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete mfe__ver" do
    setup [:create_mfe__ver]

    test "deletes chosen mfe__ver", %{conn: conn, mfe__ver: mfe__ver} do
      conn = delete(conn, Routes.mfe__ver_path(conn, :delete, mfe__ver))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.mfe__ver_path(conn, :show, mfe__ver))
      end
    end
  end

  defp create_mfe__ver(_) do
    mfe__ver = fixture(:mfe__ver)
    %{mfe__ver: mfe__ver}
  end
end
