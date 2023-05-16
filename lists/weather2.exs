defmodule WeatherHistory do
  def for_location([], _target_loc), do: []
  def for_location([ head = [_, target_loc, _, _ ] | tail], target_loc) do
    [ head | for_location(tail, target_loc) ]
  end
  def for_location([ _ | tail ], target_loc), do: for_location(tail, target_loc)

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
