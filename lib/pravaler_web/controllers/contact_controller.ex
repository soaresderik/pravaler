defmodule PravalerWeb.ContactController do
  use PravalerWeb, :controller

  alias Pravaler.Contacts
  alias Pravaler.Contacts.Contact

  action_fallback PravalerWeb.FallbackController

  def create(conn, %{"contact" => contact_params}) do
    with {:ok, %Contact{} = contact} <- Contacts.create_contact(contact_params) do
      conn
      |> put_status(:created)
      |> render("show.json", contact: contact)
    end
  end

  def show(conn, %{"id" => id}) do
    contact = Contacts.get_contact!(id)
    render(conn, "show.json", contact: contact)
  end
end
