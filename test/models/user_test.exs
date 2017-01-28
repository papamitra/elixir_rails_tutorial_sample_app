defmodule SampleApp.UserTest do
  use SampleApp.ModelCase

  alias SampleApp.User

  @valid_attrs %{email: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
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

end
