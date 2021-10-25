defmodule Pravaler.ContactsTest do
  use Pravaler.DataCase

  alias Pravaler.Contacts

  describe "contacts" do
    alias Pravaler.Contacts.Contact

    @valid_attrs %{
      email: "some@email.com",
      message: "some message",
      name: "some name",
      phone_number: "99999999",
      subject: "some subject"
    }

    @invalid_attrs %{email: nil, message: nil, name: nil, phone_number: nil, subject: nil}

    def contact_fixture(attrs \\ %{}) do
      {:ok, contact} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Contacts.create_contact()

      contact
    end

    test "get_contact!/1 returns the contact with given id" do
      contact = contact_fixture()
      assert Contacts.get_contact!(contact.id) == contact
    end

    test "create_contact/1 with valid data creates a contact" do
      assert {:ok, %Contact{} = contact} = Contacts.create_contact(@valid_attrs)
      assert contact.email == "some@email.com"
      assert contact.message == "some message"
      assert contact.name == "some name"
      assert contact.phone_number == "99999999"
      assert contact.subject == "some subject"
    end

    test "create_contact/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Contacts.create_contact(@invalid_attrs)
    end
  end
end
