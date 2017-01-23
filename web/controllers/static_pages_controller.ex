defmodule SampleApp.StaticPagesController do
  use SampleApp.Web, :controller

  def home(conn, _params) do
    render conn, "home.html", title: ""
  end

  def help(conn, _params) do
    render conn, "help.html", title: "Help"
  end

  def about(conn, _params) do
    render conn, "about.html", title: "About"
  end

  def contact(conn, _params) do
    render conn, "contact.html", title: "Contact"
  end

end
