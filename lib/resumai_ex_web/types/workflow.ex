defmodule ResumaiExWeb.Types.Workflow do
  use Absinthe.Schema.Notation
  import_types(ResumaiExWeb.Types.Screen)

  object :workflow do
    field :id, :id
    field :name, :string
    field :title, :string
    field :screens, list_of(:screen)
  end
end
