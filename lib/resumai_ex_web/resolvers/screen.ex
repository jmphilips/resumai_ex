defmodule ResumaiExWeb.Resolvers.Screen do
  @moduledoc """
  Resolver for Screens
  """

  def home do
    %{
      :name => "Home",
      :id => 1,
      :title => "Welcome to Resumai!"
    }
  end

  def create_user do
    %{
      :name => "Create User",
      :title => "Create a new user",
      :id => 2
    }
  end
end
