defmodule UsNoaa.XMLStateParser do
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
    [
      get_value(xml, '/current_observation/station_id'),
      get_value(xml, '/current_observation/location'),
      get_value(xml, '/current_observation/weather'),
      get_value(xml, '/current_observation/temp_c')
    ]
  end

  defp get_value(xml, xpath) do
    [element] = :xmerl_xpath.string(xpath, xml)
    [text]    = xmlElement(element, :content)
    xmlText(text, :value)
  end
end
