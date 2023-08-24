defmodule ResumaiExWeb.Resolvers.Authentication do
  @moduledoc """
  Resolver for Authentication mutations and queries
  """

  alias ResumaiEx.Token

  def create(_parent, _args, _resolution) do
    with {:ok, token, _claims} <- Token.generate_and_sign() do
      {:ok,
       %{
         token: token
       }}
    end
  end
end
