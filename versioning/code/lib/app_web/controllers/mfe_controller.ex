defmodule AppWeb.MfeController do
  use AppWeb, :controller

  alias App.Catalog
  alias App.Catalog.Mfe

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    mfes = Catalog.list_mfes()
    render(conn, "index.json", mfes: mfes)
  end

  def create(conn, %{"mfe" => mfe_params}) do
    with {:ok, %Mfe{} = mfe} <- Catalog.create_mfe(mfe_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.mfe_path(conn, :show, mfe))
      |> render("show.json", mfe: mfe)
    end
  end

  def show(conn, %{"id" => id}) do
    mfe = Catalog.get_mfe!(id)
    render(conn, "show.json", mfe: mfe)
  end

  def update(conn, %{"id" => id, "mfe" => mfe_params}) do
    mfe = Catalog.get_mfe!(id)

    with {:ok, %Mfe{} = mfe} <- Catalog.update_mfe(mfe, mfe_params) do
      render(conn, "show.json", mfe: mfe)
    end
  end

  def delete(conn, %{"id" => id}) do
    mfe = Catalog.get_mfe!(id)

    with {:ok, %Mfe{}} <- Catalog.delete_mfe(mfe) do
      send_resp(conn, :no_content, "")
    end
  end
end
