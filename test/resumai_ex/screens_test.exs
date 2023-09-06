defmodule ResumaiEx.ScreensTest do
  use ExUnit.Case

  alias ResumaiEx.Screens
  alias ResumaiEx.Screen

  @yaml [
    %{
      "screen" => %{
        "name" => "test",
        "id" => 1,
        "title" => "test"
      }
    }
  ]

  describe("build_from_yaml_files") do
    test("Takes in an argument of screens and returns a result tuple") do
      {status, result} = Screens.build_from_yaml_files(@yaml)
      assert status == :ok

      assert result ==
               [
                 %Screen{
                   name: "test",
                   id: 1,
                   title: "test"
                 }
               ]
    end
  end
end
