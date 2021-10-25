defmodule Pravaler.Contacts do
  import Bamboo.Email
  alias Pravaler.Mailer

  import Ecto.Query, warn: false
  alias Pravaler.Repo

  alias Pravaler.Contacts.Contact

  def get_contact!(id), do: Repo.get!(Contact, id)

  def create_contact(attrs \\ %{}) do
    attrs
    |> Contact.changeset()
    |> Repo.insert()
    |> send_email()
  end

  defp send_email({:ok, contact}) do
    new_email(
      to: contact.email,
      from: "app@pravaler.com.br",
      subject: contact.subject,
      text_body: "
        Olá, #{contact.name}. Seu contato foi cadastrado corretamente.
        Mensagem: #{contact.message}
      "
    )
    |> Mailer.deliver_later!()

    {:ok, contact}
  end

  defp send_email(params), do: params
end
