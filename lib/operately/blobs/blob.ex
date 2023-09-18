defmodule Operately.Blobs.Blob do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "blobs" do
    belongs_to :company, Operately.Companies.Company
    belongs_to :author, Operately.People.Person

    field :filename, :string
    field :status, Ecto.Enum, values: [:pending, :uploaded, :deleted]

    timestamps()
  end

  @doc false
  def changeset(blob, attrs) do
    blob
    |> cast(attrs, [:filename, :author_id, :company_id, :status])
    |> validate_required([:filename, :author_id, :status, :company_id])
  end
end
