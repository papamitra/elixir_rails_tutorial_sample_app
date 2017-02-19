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

  defmacro assert_difference(expr, expect, do: block) do
    quote do
      pval = unquote(expr)
      unquote(block)
      assert (unquote(expr) - pval) == unquote(expect)
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
                                                 "password_confirmation" => "bar"}}
    end

    assert_template conn, "new.html"
  end

  test "valid signup information" do
    conn = build_conn()
    assert_difference Repo.aggregate(User, :count, :id), 1 do
      conn = post conn, "/users", %{"user" => %{"name" => "Example User",
                                                 "email" => "user@example.com",
                                                 "password" => "password",
                                                 "password_confirmation" => "password"}}
    end
    assert redirected_to(conn) =~ ~r|users/\d+|
  end
end
