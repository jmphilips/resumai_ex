defmodule ResumaiExWeb.Resolvers.Experience do
  @moduledoc false
  alias ResumaiEx.Otp.TokenAgent

  def count(_parent, _args, _resolution) do
    TokenAgent.decrement()

    {:ok, %{count: TokenAgent.value(), id: 1}}
  end
end
