defmodule Pravaler.Contacts.Contact do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "contacts" do
    field :email, :string
    field :message, :string
    field :name, :string
    field :phone_number, :string
    field :subject, :string

    timestamps()
  end

  @doc false
  def changeset(contact) do
    %__MODULE__{}
    |> cast(contact, [:name, :email, :phone_number, :subject, :message])
    |> validate_required([:name, :email, :subject])
    |> validate_format(:email, ~r/@/)
    |> validate_format(:phone_number, ~r/^\d+$/)
    |> unique_constraint(:email)
  end
end
