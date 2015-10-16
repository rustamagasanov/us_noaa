# defrecord :xmlElement, Record.extract(:xmlElement, from_lib: "xmerl/include/xmerl.hrl")
# defrecord :xmlText, Record.extract(:xmlText, from_lib: "xmerl/include/xmerl.hrl")

defmodule UsNoaa.XMLParser do
  def parse(xml) do
    xml
      |> scan
      |> get_data
  end

  defp scan(xml) do
    :xmerl_scan.string(String.to_char_list(xml))
  end

  defp get_data({ xml, _rest }) do
    # IO.inspect xml
    [credit_element]  = :xmerl_xpath.string('/current_observation/credit', xml)
    [credit_text] = credit_element.content
    credit = credit_text.value

    IO.inspect credit
  end
end
