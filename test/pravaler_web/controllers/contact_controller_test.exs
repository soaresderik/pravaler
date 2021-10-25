defmodule PravalerWeb.ContactControllerTest do
  use PravalerWeb.ConnCase

  alias Pravaler.Contacts
  alias Pravaler.Contacts.Contact

  @create_attrs %{
    email: "some@email.com",
    message: "some message",
    name: "some name",
    phone_number: "99999999",
    subject: "some subject"
  }

  @invalid_attrs %{email: nil, message: nil, name: nil, phone_number: nil, subject: nil}

  def fixture(:contact) do
    {:ok, contact} = Contacts.create_contact(@create_attrs)
    contact
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "create contact" do
    test "renders contact when data is valid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.contact_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some@email.com",
               "message" => "some message",
               "name" => "some name",
               "phone_number" => "99999999",
               "subject" => "some subject"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.contact_path(conn, :create), contact: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  defp create_contact(_) do
    contact = fixture(:contact)
    %{contact: contact}
  end
end
