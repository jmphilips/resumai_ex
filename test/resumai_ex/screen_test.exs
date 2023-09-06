defmodule ResumaiEx.ScreenTest do
  use ExUnit.Case

  alias ResumaiEx.Screen

  @new_screen %{
    id: 1,
    name: "New Screen"
  }

  test "#build is defined" do
    output = Screen.build(@new_screen)
    assert output
  end

  test "#build returns a result tuple" do
    {status, _result} = Screen.build(@new_screen)
    assert status == :ok
  end

  test "#build returns a result tuple with a %Screen{} result" do
    {_status, result} = Screen.build(@new_screen)
    assert result = %Screen{id: 1, name: "New Screen"}
  end

  describe("build_from_yaml/1") do
    @yaml %{
      "screen" => %{
        "name" => "test",
        "id" => 1,
        "title" => "test"
      }
    }

    test("takes a map as an argument and returns a %Screen{}") do
      output = Screen.build_from_yaml(@yaml)

      assert output ==
               %Screen{
                 name: "test",
                 id: 1,
                 title: "test"
               }
    end
  end
end
