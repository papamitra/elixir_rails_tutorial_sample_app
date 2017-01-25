defmodule SampleApp.SiteLayoutTest do
  use SampleApp.ConnCase

  defp assert_select(pattern, resp, opts \\ []) do
    count = opts[:count] || 1
    assert (Floki.find(resp, pattern) |> Enum.count) == count
  end

  test "layout links", %{conn: conn} do
    conn = get conn, root_path(conn, :home)
    resp = html_response(conn, 200)
    assert_select ~s|a[href="#{root_path(conn, :home)}"]|, resp, count: 2
    assert_select ~s|a[href="#{static_pages_path(conn, :help)}"]|, resp
    assert_select ~s|a[href="#{static_pages_path(conn, :about)}"]|, resp
    assert_select ~s|a[href="#{static_pages_path(conn, :contact)}"]|, resp
  end
end
