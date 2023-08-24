defmodule ResumaiEx.Workflow.Base do
  @moduledoc """
  Base for resolving workflows
  """

  def home do
    %{
      :id => 1,
      :name => "Home",
      :title => "Welcome to ResumAI!",
      :screens => [home_screen()]
    }
  end

  def create_user do
    %{
      :id => 2,
      :name => "Create User",
      :title => "Please fill out the correct information",
      :screens => [
        create_user_screen_name()
      ]
    }
  end

  defp create_user_screen_name do
    %{
      :id => 2,
      :name => "User Name",
      :title => "Please provide the user name",
      :components => [
        first_name(),
        last_name()
      ]
    }
  end

  defp create_user_screen_contact do
    %{
      :id => 3,
      :name => "User Contact",
      :title => "Please provide contact information",
      :components => [
        first_name(),
        last_name()
      ]
    }
  end

  defp first_name do
    %{
      :id => 2,
      :name => "First Name",
      :type => "Input",
      :text => "Please Provide Your Last Name"
    }
  end

  defp last_name do
    %{
      :id => 3,
      :name => "Last Name",
      :type => "Input",
      :text => "Please Provide Your Last Name"
    }
  end

  defp home_screen do
    %{
      :id => 1,
      :name => "Home",
      :title => "Please select a workflow",
      :components => [
        button()
      ]
    }
  end

  defp button do
    %{
      :id => 1,
      :name => "Button",
      :type => "Button",
      :text => "Select"
    }
  end
end
