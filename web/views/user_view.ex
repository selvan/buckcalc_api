defmodule BuckcalcApi.UserView do
  use BuckcalcApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, BuckcalcApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, BuckcalcApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      password_digest: user.password_digest,
      role: user.role}
  end
end
