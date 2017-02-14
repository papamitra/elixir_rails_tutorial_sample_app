defmodule SampleApp.ApplicationHelpers do

  import Phoenix.HTML.Tag

  @base_title "Ruby on Rails Tutorial Sample App"
  def full_title() do
    @base_title
  end
  def full_title("") do
    @base_title
  end
  def full_title(page_title) do
    page_title <> " | " <> @base_title
  end
end
