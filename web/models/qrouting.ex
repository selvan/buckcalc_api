defmodule BuckcalcWeb.QRouting do
  use BuckcalcWeb.Web, :model

  schema "qroutings" do
    belongs_to :question, BuckcalcWeb.Question
    belongs_to :analyst, {"users", BuckcalcWeb.User}, foreign_key: :answered_by
    timestamps
    
    has_many :chats, {"qchat", BuckcalcWeb.QChat}, foreign_key: :qrouting_id
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
