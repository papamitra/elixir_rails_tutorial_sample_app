defmodule SampleApp.PageController do
  use SampleApp.Web, :controller

  def index(conn, _params) do
    # render conn, "index.html"
    conn |> put_status(200) |> html("Hello, world!")
  end
end
