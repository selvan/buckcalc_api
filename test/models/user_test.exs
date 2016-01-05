defmodule BuckcalcApi.UserTest do
  use BuckcalcApi.ModelCase

  alias BuckcalcApi.User

  @valid_attrs %{email: "some content", name: "some content", password_digest: "some content", role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
