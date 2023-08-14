defmodule ResumaiEx.User do
  @moduledoc false

  @all [
    %{
      :first_name => "Joshua",
      :last_name => "Philips",
      :phone_number => "6116161661",
      :city => "New York",
      :state => "New York",
      :linked_in => "www.linkedin.com/in/jmichaelphilips"
    }
  ]

  def list_all, do: @all
end
