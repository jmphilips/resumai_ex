defmodule ResumaiExWeb.Types.Component do
  use Absinthe.Schema.Notation

  object :component do
    field :id, :id
    field :text, :string
    field :name, :string
  end
end
