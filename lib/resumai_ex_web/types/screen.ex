defmodule ResumaiExWeb.Types.Screen do
  use Absinthe.Schema.Notation
  import_types(ResumaiExWeb.Types.Component)

  object :screen do
    field :id, :id
    field :name, :string
    field :title, :string
    field :components, list_of(:component)
    field :previous, :screen
    field :next, :screen
  end
end
