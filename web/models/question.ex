defmodule BuckcalcApi.Question do
  use BuckcalcApi.Web, :model

  schema "questions" do
    field :question, :string
    belongs_to :owner, {"users", BuckcalcApi.User}, foreign_key: :asked_by
    timestamps

    has_many :routings, BuckcalcApi.QRouting
    has_many :analysts, through: [:routings, :analyst]
  end

  @required_fields ~w(question asked_by)
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
