defmodule ResumaiEx.Repo do
  use Ecto.Repo,
    otp_app: :resumai_ex,
    adapter: Ecto.Adapters.SQLite3
end
