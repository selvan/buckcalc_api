defmodule BuckcalcApi.QRouting do
  use BuckcalcApi.Web, :model

  schema "qroutings" do
    belongs_to :question, BuckcalcApi.Question
    belongs_to :analyst, {"users", BuckcalcApi.User}, foreign_key: :answered_by
    timestamps
    
    has_many :chats, {"qchat", BuckcalcApi.QChat}, foreign_key: :qrouting_id
  end

  @required_fields ~w(question_id answered_by)
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
