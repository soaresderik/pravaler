defmodule PravalerWeb.ContactView do
  use PravalerWeb, :view
  alias PravalerWeb.ContactView

  def render("index.json", %{contacts: contacts}) do
    %{data: render_many(contacts, ContactView, "contact.json")}
  end

  def render("show.json", %{contact: contact}) do
    %{data: render_one(contact, ContactView, "contact.json")}
  end

  def render("contact.json", %{contact: contact}) do
    %{id: contact.id,
      name: contact.name,
      email: contact.email,
      phone_number: contact.phone_number,
      subject: contact.subject,
      message: contact.message}
  end
end
