defmodule SampleApp.User do
  use SampleApp.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    validate_email_regex = ~r/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    struct
    |> cast(params, [:name, :email])
    |> validate_required([:name, :email])
    |> validate_length(:name, max: 50)
    |> validate_length(:email, max: 255)
    |> validate_format(:email, validate_email_regex)
  end
end
