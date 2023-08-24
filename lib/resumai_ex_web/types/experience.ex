defmodule ResumaiExWeb.Types.Experience do
  use Absinthe.Schema.Notation

  object :experience do
    field :id, :id
    field :count, :integer
  end
end
