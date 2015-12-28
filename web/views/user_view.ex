defmodule BuckcalcWeb.UserView do
  use BuckcalcWeb.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, BuckcalcWeb.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, BuckcalcWeb.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      email: user.email,
      password_digest: user.password_digest,
      role: user.role}
  end
end
