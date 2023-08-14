defmodule ResumaiExWeb.Resolvers.User do
  @moduledoc false

  def list_all(_parent, _args, _resolution) do
    {:ok, ResumaiEx.User.list_all()}
  end
end
