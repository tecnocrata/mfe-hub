defmodule AppWeb.MfeView do
  use AppWeb, :view
  alias AppWeb.MfeView

  def render("index.json", %{mfes: mfes}) do
    %{data: render_many(mfes, MfeView, "mfe.json")}
  end

  def render("show.json", %{mfe: mfe}) do
    %{data: render_one(mfe, MfeView, "mfe.json")}
  end

  def render("mfe.json", %{mfe: mfe}) do
    %{id: mfe.id,
      name: mfe.name,
      semver: mfe.semver,
      tenant: mfe.tenant,
      urladdress: mfe.urladdress}
  end
end
