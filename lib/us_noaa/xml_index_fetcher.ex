defmodule UsNoaa.XMLIndexFetcher do
  @site Application.get_env(:us_noaa, :site)

  def fetch do
    HTTPoison.get(@site)
    |> handle_response
  end

  defp handle_response({ :ok, %HTTPoison.Response{ status_code: 200, body: body } }) do
    body
  end

  defp handle_response({ :ok, %HTTPoison.Response{ status_code: 404, body: body } }) do
    IO.puts "Index page responded with 404"
    System.halt(0)
  end

  defp handle_response({ :error, %HTTPoison.Error{ reason: reason } }) do
    IO.puts "Error #{reason} returned"
    System.halt(0)
  end
end
