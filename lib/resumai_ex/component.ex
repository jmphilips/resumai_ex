defmodule ResumaiEx.Component do
  @moduledoc """
  Module for building components
  """
  alias __MODULE__
  defstruct [:text]

  def new, do: {:ok, %Component{}}

  def build({:ok, component}, %{text: text}) do
    {:ok, %Component{component | text: text}}
  end
end
