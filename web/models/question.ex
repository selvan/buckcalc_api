defmodule BuckcalcWeb.Question do
  use BuckcalcWeb.Web, :model

  schema "questions" do
    field :question, :map
    belongs_to :owner, {"users", BuckcalcWeb.User}, foreign_key: :asked_by

    has_many :routings, BuckcalcWeb.QRouting
    has_many :analysts, through: [:routings, :analyst]
  end

  @required_fields ~w()
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
