defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :neptune | :uranus

  @orbital_period %{
    :mercury => 0.2408467,
    :venus   => 0.61519726,
    :mars    => 1.8808158,
    :jupiter => 11.862615,
    :saturn  => 29.447498,
    :uranus  => 84.016846,
    :neptune => 164.79132
  }

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds
      |> in_earth_years
      |> in_planet_solar_years(planet)
  end

  defp in_earth_years(seconds), do: seconds / 60 / 60 / 24 / 365.25
  defp in_planet_solar_years(earth_years, :earth), do: earth_years
  defp in_planet_solar_years(earth_years, planet) do
    earth_years / @orbital_period[planet]
  end
end
