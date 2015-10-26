defmodule UsNoaa.XMLStateFetcher do
  def fetch(url) do
    HTTPoison.get(url, [], [hackney: [follow_redirect: true]])
    |> handle_response
  end

  defp handle_response({ :ok, %HTTPoison.Response{ status_code: 200, body: body } }) do
    body
  end

  defp handle_response({ :ok, %HTTPoison.Response{ status_code: 404, body: body } }) do
    IO.puts "State URL responded with 404"
    System.halt(0)
  end

  defp handle_response({ :error, %HTTPoison.Error{ reason: reason } }) do
    IO.puts "Error #{reason} returned"
    System.halt(0)
  end
end
