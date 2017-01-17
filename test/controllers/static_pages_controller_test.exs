defmodule SampleApp.StaticPagesControllerTest do
  use SampleApp.ConnCase

  @base_title "Ruby on Rails Tutorial Sample App"

  defp get_title(conn) do
    Floki.find(html_response(conn, 200), "title") |> Enum.at(0) |> elem(2) |> Enum.at(0)
  end

  test "should get home", %{conn: conn} do
    conn = get conn, static_pages_path(conn, :home)
    assert "Home | #{@base_title}" == get_title(conn)
  end

  test "should get help", %{conn: conn} do
    conn = get conn, static_pages_path(conn, :help)
    assert "Help | #{@base_title}" == get_title(conn)
  end

  test "should get about", %{conn: conn} do
    conn = get conn, static_pages_path(conn, :about)
    assert "About | #{@base_title}" == get_title(conn)
  end
end
