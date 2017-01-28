defmodule SampleApp.UserControllerTest do
  use SampleApp.ConnCase

  alias SampleApp.User
  @valid_attrs %{}
  @invalid_attrs %{}

  test "should get new", %{conn: conn} do
    conn = get conn, signup_path(conn, :new)
    assert html_response(conn, 200)
  end
end
