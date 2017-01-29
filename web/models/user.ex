defmodule SampleApp.User do
  use SampleApp.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string

    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :password_digest, :string

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
    |> update_change(:email, &String.downcase/1)
    |> unique_constraint(:email)
    |> has_secure_password(params)
  end

  def has_secure_password(struct, params) do
    struct
    |> cast(params, [:password, :password_confirmation])
    |> validate_required([:password, :password_confirmation])
    |> validate_length(:password, min: 6)
    |> put_pass_digest
  end

  defp put_pass_digest(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        put_change(changeset, :password_digest, Comeonin.Bcrypt.hashpwsalt(pass))
      _ ->
        changeset
    end
  end

end

