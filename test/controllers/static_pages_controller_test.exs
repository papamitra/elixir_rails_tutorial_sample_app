defmodule SampleApp.StaticPagesControllerTest do
  use SampleApp.ConnCase

  test "should get home", %{conn: conn} do
    conn = get conn, static_pages_path(conn, :home)
    assert html_response(conn, 200)
  end

  test "should get help", %{conn: conn} do
    conn = get conn, static_pages_path(conn, :help)
    assert html_response(conn, 200)
  end
end
