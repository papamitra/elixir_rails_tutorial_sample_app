defmodule SampleApp.StaticPagesController do
  use SampleApp.Web, :controller

  def home(conn, _params) do
    render conn, "home.html", layout: false
  end

  def help(conn, _params) do
    render conn, "help.html", layout: false
  end

  def about(conn, _params) do
    render conn, "about.html", layout: false
  end

end
