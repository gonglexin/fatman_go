defmodule FatmanGo.Place do
  @derive Jason.Encoder
  defstruct [:lat, :lon, :last_update]
end
