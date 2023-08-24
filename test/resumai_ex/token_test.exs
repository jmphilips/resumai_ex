defmodule ResumaiEx.TokenTest do
  use ExUnit.Case
  @moduledoc false

  test "when configured correclty it returns an ok status" do
    {status, jwt, claims} = ResumaiEx.Token.generate_and_sign()
    assert status == :ok
  end

  test "when configured correctly it returns the correct signer" do
    {_, _, claims} = ResumaiEx.Token.generate_and_sign()
    %{"iss" => issuer} = claims
    assert issuer == "Resumai"
  end
end
