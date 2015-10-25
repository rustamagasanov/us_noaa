defmodule UsNoaa.XMLFetcher do
  # require Logger
  #
  # def fetch(state_id) do
  #   HTTPoison.get("#{@site}/#{state_id}.xml")
  #     |> handle_response
  # end
  #
  # defp handle_response({ :ok, %HTTPoison.Response{ status_code: 200, body: body } }) do
  #   body
  # end
  #
  # defp handle_response({ :ok, %HTTPoison.Response{ status_code: 404, body: body } }) do
  #   IO.puts "Document doesn't exist(try uppercase?)."
  #   System.halt(0)
  # end
  #
  # defp handle_response({ :error, %HTTPoison.Error{ reason: reason } }) do
  #   Logger.error "Error #{reason} returned"
  #   System.halt(0)
  # end
end
