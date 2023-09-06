defmodule ResumaiEx.Screen do
  @moduledoc """
  Module for Screen
  """
  alias __MODULE__
  defstruct [:name, :id, :title]

  def build(%{name: name, id: id}) do
    {:ok, %Screen{name: name}}
  end

  def build_from_yaml(%{"screen" => %{"name" => name, "id" => id, "title" => title}}) do
    %Screen{name: name, id: id, title: title}
  end
end
