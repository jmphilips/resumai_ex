defmodule ResumaiExWeb.Resolvers.User do
  @moduledoc false

  def list_all(_parent, _args, _resolution) do
    all_users = ResumaiEx.Otp.UserAgent.value()
    {:ok, all_users}
  end

  def create(_parent, args, _resolution) do
    ResumaiEx.Otp.UserAgent.add_user(args)
    {:ok, args}
  end
end
