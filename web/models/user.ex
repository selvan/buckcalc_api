defmodule BuckcalcApi.User do
  use BuckcalcApi.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password_digest, :string
    field :role, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true    
    timestamps

    has_many :questions, BuckcalcApi.Question, foreign_key: :asked_by
  end

  @required_fields ~w(email password password_confirmation)
  @optional_fields ~w(name password_digest role)

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> unique_constraint(:email)
  end  
end
