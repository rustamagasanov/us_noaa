defmodule UsNoaa.XMLParser do
  def parse(xml) do
    IO.inspect xml
    :xmerl_scan.string(String.to_char_list(xml))
  end
end
