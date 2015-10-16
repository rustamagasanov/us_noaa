defmodule UsNoaa.XMLParser do
  require Record
  Record.defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
  Record.defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")


  def parse(xml) do
    xml
      |> scan
      |> get_data
  end

  defp scan(xml) do
    :xmerl_scan.string(String.to_char_list(xml))
  end

  defp get_data({ xml, _rest }) do
    [credit_element]  = :xmerl_xpath.string('/current_observation/credit', xml)
    [credit_text] = xmlElement(credit_element, :content)
    credit = xmlText(credit_text, :value)

    IO.inspect to_string(credit)
  end
end
