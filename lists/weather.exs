defmodule WeatherHistory do
  def for_location_27([]), do: []
  def for_location_27([ [time, 27, temp, rain ] | tail]) do
    [ [time, 27, temp, rain] | for_location_27(tail) ]
  end
  def for_location_27([ _ | tail ]), do: for_location_27(tail)

  def test_data do
    [
      [1366225622, 26, 15, 0.123],
      [1366225621, 27, 16, 0.123],
      [1366225622, 27, 17, 0.124],
      [1366225622, 26, 15, 0.123],
      [1366225622, 26, 15, 0.123],
      [1366225622, 28, 15, 0.123],
      [1366225622, 28, 15, 0.123],
      [1366225622, 26, 15, 0.123],
      [1366225622, 26, 15, 0.123],
      [1366225623, 27, 18, 0.129]
    ]
  end
end
