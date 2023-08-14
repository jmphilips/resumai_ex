defmodule ResumaiExWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :id
    field :first_name, :string
    field :last_name, :string
    field :city, :string
    field :state, :string
    field :country, :string
    field :linked_in, :string
  end
end
