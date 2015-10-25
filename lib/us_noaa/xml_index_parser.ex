defmodule UsNoaa.XMLIndexParser do
  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText,    Record.extract(:xmlText,    from_lib: "xmerl/include/xmerl.hrl")

  def parse(xml) do
    xml
    |> scan
    |> get_data
  end

  defp scan(xml) do
    :xmerl_scan.string(String.to_char_list(xml))
  end

  defp get_data({ xml, _rest }) do
    elements = :xmerl_xpath.string('/wx_station_index//station/xml_url', xml)
    Enum.each(
      elements,
      fn(element) ->
        [text] = xmlElement(element, :content)
        value  = xmlText(text, :value)
        IO.inspect to_string(value)
      end
    )
  end
end
