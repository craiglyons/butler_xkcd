defmodule Butler.XKCD do
  @moduledoc """
  Get an image of the latest XKCD comic
  """

  use Butler.Plugin

  @url "http://xkcd.com/info.0.json"

  @usage """
  #{name} xkcd - grab the latest xkcd comic
  """
  respond(~r/xkcd/, conn) do
    response = Poison.decode!(HTTPoison.get!(@url).body)
    reply conn, response["img"]
  end
end
