defmodule ResumaiEx.ComponentTest do
  use ExUnit.Case

  alias ResumaiEx.Component

  @new_component {
    :ok,
    %Component{}
  }

  @component_text "Some Text"

  test("new/0 is defined") do
    output = Component.new()
    assert output
  end

  test("new/0 returns a result tuple") do
    {status, _result} = Component.new()
    assert status == :ok
  end

  test("new/0 returns a result tuple with %Component{} as the result") do
    {_status, result} = Component.new()
    assert result == %Component{}
  end

  test("build/2 is defined") do
    output = Component.build(@new_component, %{text: @component_text})
    assert output
  end
end
