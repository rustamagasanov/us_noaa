defmodule UsNoaa.XMLFetcher do
  @site Application.get_env(:us_noaa, :site)

  def fetch(state_id) do
    HTTPoison.get("#{@site}/#{state_id}.xml")
  end
end
