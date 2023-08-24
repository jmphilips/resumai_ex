defmodule ResumaiEx.Otp.UserAgent do
  @moduledoc false

  use Agent

  def start_link(initial_value = []) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def add_user(user) do
    Agent.update(__MODULE__, fn state -> state ++ [user] end)
  end
end
