defmodule SampleApp.UserController do
  use SampleApp.Web, :controller

  alias SampleApp.User

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render conn, "new.html", title: "", changeset: changeset
  end

  def show(conn, params) do
    user = Repo.one(from u in User, where: u.id == ^params["id"])
    render conn, "show.html", title: "", user: user
  end

end
