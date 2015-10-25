defmodule UsNoaa.CLI do
  require Logger

  def main(argv) do
    argv
      |> parse_args
      |> process
  end

  defp parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      { [help: true], _,      _ } -> :help
      _                           -> nil
    end
  end

  defp process(:help) do
    IO.puts """
    Usage: ./us_noaa
    """
    System.halt(0)
  end

  defp process do
    Enum.each(
      get_states, fn ->
        UsNoaa.XMLStateFetcher.fetch
        |> UsNoaa.XMLStateParser.parse
      end
    )
  end

  defp get_states do
    UsNoaa.XMLIndexFetcher.fetch
    |> UsNoaa.XMLIndexParser.parse
  end
end

