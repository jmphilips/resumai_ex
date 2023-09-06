defmodule ResumaiEx.Screens do
  @moduledoc """
  Module for Screens
  """

  alias ResumaiEx.{Screen}

  def build_from_yaml_files(screens) do
    {:ok, screens |> Enum.map(&Screen.build_from_yaml/1)}
  end
end
