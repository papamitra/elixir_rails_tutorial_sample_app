defmodule SampleApp.UserController do
  use SampleApp.Web, :controller

  alias SampleApp.User

  def new(conn, _params) do
    render conn, "new.html", title: ""
  end

  def show(conn, params) do
    user = Repo.one(from u in User, where: u.id == ^params["id"])
    render conn, "show.html", title: "", user: user
  end

end
