defmodule AppWeb.MfeControllerTest do
  use AppWeb.ConnCase

  alias App.Catalog
  alias App.Catalog.Mfe

  @create_attrs %{
    name: "some name",
    semver: "some semver",
    tenant: "some tenant",
    urladdress: "some urladdress"
  }
  @update_attrs %{
    name: "some updated name",
    semver: "some updated semver",
    tenant: "some updated tenant",
    urladdress: "some updated urladdress"
  }
  @invalid_attrs %{name: nil, semver: nil, tenant: nil, urladdress: nil}

  def fixture(:mfe) do
    {:ok, mfe} = Catalog.create_mfe(@create_attrs)
    mfe
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all mfes", %{conn: conn} do
      conn = get(conn, Routes.mfe_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create mfe" do
    test "renders mfe when data is valid", %{conn: conn} do
      conn = post(conn, Routes.mfe_path(conn, :create), mfe: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.mfe_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name",
               "semver" => "some semver",
               "tenant" => "some tenant",
               "urladdress" => "some urladdress"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.mfe_path(conn, :create), mfe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update mfe" do
    setup [:create_mfe]

    test "renders mfe when data is valid", %{conn: conn, mfe: %Mfe{id: id} = mfe} do
      conn = put(conn, Routes.mfe_path(conn, :update, mfe), mfe: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.mfe_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name",
               "semver" => "some updated semver",
               "tenant" => "some updated tenant",
               "urladdress" => "some updated urladdress"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, mfe: mfe} do
      conn = put(conn, Routes.mfe_path(conn, :update, mfe), mfe: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete mfe" do
    setup [:create_mfe]

    test "deletes chosen mfe", %{conn: conn, mfe: mfe} do
      conn = delete(conn, Routes.mfe_path(conn, :delete, mfe))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.mfe_path(conn, :show, mfe))
      end
    end
  end

  defp create_mfe(_) do
    mfe = fixture(:mfe)
    %{mfe: mfe}
  end
end
