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

  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "#{user.name} created!")
        |> redirect(to: user_path(conn, :show, user.id))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset, title: "")
    end

  end

end
