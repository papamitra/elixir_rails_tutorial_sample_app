defmodule SampleApp.UserTest do
  use SampleApp.ModelCase

  alias SampleApp.User
  alias SampleApp.Repo

  @user %{name: "Example User", email: "user@example.com"}

  setup do
    changeset = User.changeset(%User{}, @user)
    Repo.insert(changeset)
    :ok
  end

  test "name should be present" do
    changeset = User.changeset(%User{}, %{name: "     ", email: "user@example.com"})
    refute changeset.valid?
  end

  test "email should be present" do
    changeset = User.changeset(%User{}, %{name: "Example User", email: "     "})
    refute changeset.valid?
  end

  test "name should not be too long" do
    changeset = User.changeset(%User{}, %{name: String.duplicate("a", 51), email: "user@example.com"})
    refute changeset.valid?
  end

  test "email should bnot be too long" do
    changeset = User.changeset(%User{}, %{name: "Example User", email: String.duplicate("a", 244) <> "@example.com"})
    refute changeset.valid?
  end

  test "email validation should accept valid address" do
    valid_addresses = ~w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]

    Enum.each valid_addresses, fn valid_address ->
      changeset = User.changeset(%User{}, %{name: "Example User", email: valid_address})
      assert changeset.valid?
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = ~w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]

    Enum.each invalid_addresses, fn invalid_address ->
      changeset = User.changeset(%User{}, %{name: "Example User", email: invalid_address})
      refute changeset.valid?
    end
  end

  test "email addresses should be unique" do
    attrs = Map.put(@user, :email, @user[:email] |> String.upcase)
    dup = User.changeset(%User{}, attrs)
    assert {:error, dup} = Repo.insert(dup)
  end
end
