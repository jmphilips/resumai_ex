defmodule ResumaiExWeb.Types.Component do
  use Absinthe.Schema.Notation

  object :component do
    field :id, :id
    field :type, :string
    field :text, :string
    field :name, :string
  end
end
