defmodule ResumaiEx.Token do
  @moduledoc false

  use Joken.Config

  @impl true
  def token_config do
    default_claims(iss: "Resumai", aud: "Web")
  end
end
