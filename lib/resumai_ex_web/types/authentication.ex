defmodule ResumaiExWeb.Types.Authentication do
  use Absinthe.Schema.Notation

  object :authentication do
    field :token, :string
  end
end
