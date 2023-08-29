defmodule ResumaiEx.Screen do
  @moduledoc """
  Module for Screen
  """
  alias __MODULE__
  defstruct [:name, :id]

  def build(%{name: name, id: id}) do
    {:ok, %Screen{name: name}}
  end
end
