defmodule SampleApp.UsersSignupTest do
  use SampleApp.ConnCase

  alias SampleApp.Repo
  alias SampleApp.User

  defmacro assert_no_difference(expr, do: block) do
    quote do
      expect = unquote(expr)
      unquote(block)
      assert expect == unquote(expr)
    end
  end

  def assert_template(conn, template) do
    assert conn.private.phoenix_template == template
  end

  test "No difference on user count after posting invalid signup" do
    conn = build_conn()

    assert_no_difference Repo.aggregate(User, :count, :id) do
      conn = post conn, "/users", %{"user" => %{"name" => "",
                                                 "email" => "user@invalid",
                                                 "password" => "foo",
                                                 "passwork_confirmation" => "bar"}}
    end

    assert_template conn, "new.html"
  end
end
