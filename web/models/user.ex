defmodule BuckcalcWeb.User do
  use BuckcalcWeb.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_digest, :string
    field :role, :string

    timestamps
  end

  @required_fields ~w(name email password_digest role)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
