defmodule UsNoaa.XMLFetcher do
  @site "http://w1.weather.gov/xml/current_obs/"

  def fetch(state_id) do
    IO.inspect HTTPoison.get("#{@site}/#{state_id}.xml")
  end
end
