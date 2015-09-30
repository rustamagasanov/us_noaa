defmodule UsNoaa.XMLFetcher do
  require Logger

  @site Application.get_env(:us_noaa, :site)

  def fetch(state_id) do
    HTTPoison.get("#{@site}/#{state_id}.xml")
      |> handle_response
  end

  defp handle_response({ :ok, %HTTPoison.Response{ status_code: 200, body: body } }) do
    body
  end

  defp handle_response({ :error, %HTTPoison.Error{ reason: reason } }) do
    Logger.error "Error #{reason} returned"
  end
end
