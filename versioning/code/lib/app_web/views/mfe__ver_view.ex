defmodule AppWeb.Mfe_VerView do
  use AppWeb, :view
  alias AppWeb.Mfe_VerView

  def render("index.json", %{mfe_vers: mfe_vers}) do
    %{data: render_many(mfe_vers, Mfe_VerView, "mfe__ver.json")}
  end

  def render("show.json", %{mfe__ver: mfe__ver}) do
    %{data: render_one(mfe__ver, Mfe_VerView, "mfe__ver.json")}
  end

  def render("mfe__ver.json", %{mfe__ver: mfe__ver}) do
    %{id: mfe__ver.id,
      name: mfe__ver.name,
      version: mfe__ver.version,
      tenant: mfe__ver.tenant}
  end
end
