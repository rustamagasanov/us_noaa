defmodule UsNoaa.CLI do
  def main(argv) do
    argv
      |> parse_args
      |> process
  end

  defp parse_args(argv) do
    parse = OptionParser.parse(argv, switches: [help: :boolean], aliases: [h: :help])

    case parse do
      { [help: true], _, _ } -> :help
      { _, [state_id],   _ } -> { }
      { _, [state_id],   _ } -> { }
      _                      -> :help
    end
  end

  defp process(data) do
  end
end

