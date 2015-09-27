defmodule UsNoaa.XMLFetcher do
  @site "http://w1.weather.gov/xml/current_obs/"

  def fetch(state_id) do
    HTTPoison.get("#{@site}/#{state_id}.xml")
  end
end
