defmodule SampleApp.UserHelpers do
  import Phoenix.HTML.Tag

  def gravatar_for(user) do
    gravatar_id = :crypto.hash(:md5, String.downcase(user.email))
    |> Base.encode16()
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    img_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

end
