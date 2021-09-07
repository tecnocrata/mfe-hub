defmodule AppWeb.Mfe_VerController do
  use AppWeb, :controller

  alias App.Catalog
  alias App.Catalog.Mfe_Ver

  action_fallback AppWeb.FallbackController

  def index(conn, _params) do
    mfe_vers = Catalog.list_mfe_vers()
    render(conn, "index.json", mfe_vers: mfe_vers)
  end

  def create(conn, %{"mfe__ver" => mfe__ver_params}) do
    with {:ok, %Mfe_Ver{} = mfe__ver} <- Catalog.create_mfe__ver(mfe__ver_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.mfe__ver_path(conn, :show, mfe__ver))
      |> render("show.json", mfe__ver: mfe__ver)
    end
  end

  def show(conn, %{"id" => id}) do
    mfe__ver = Catalog.get_mfe__ver!(id)
    render(conn, "show.json", mfe__ver: mfe__ver)
  end

  def update(conn, %{"id" => id, "mfe__ver" => mfe__ver_params}) do
    mfe__ver = Catalog.get_mfe__ver!(id)

    with {:ok, %Mfe_Ver{} = mfe__ver} <- Catalog.update_mfe__ver(mfe__ver, mfe__ver_params) do
      render(conn, "show.json", mfe__ver: mfe__ver)
    end
  end

  def delete(conn, %{"id" => id}) do
    mfe__ver = Catalog.get_mfe__ver!(id)

    with {:ok, %Mfe_Ver{}} <- Catalog.delete_mfe__ver(mfe__ver) do
      send_resp(conn, :no_content, "")
    end
  end
end
