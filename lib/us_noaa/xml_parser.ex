defmodule UsNoaa.XMLParser do
  def parse(xml) do
    xml
      |> scan
      |> get_data
  end

  defp scan(xml) do
    :xmerl_scan.string(String.to_char_list(xml))
  end

  defp get_data(scanned_xml) do
    IO.inspect scanned_xml
  end
end
