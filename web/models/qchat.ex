defmodule BuckcalcWeb.QChat do
  use BuckcalcWeb.Web, :model

  schema "qchat" do
    field :body, :json
    belongs_to :qroutings, BuckcalcWeb.QRouting
    belongs_to :sent_by, {"users", BuckcalcWeb.User}, foreign_key: :sent_by
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
