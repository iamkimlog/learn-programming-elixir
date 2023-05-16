defmodule Chop do
  def guess(actual, a..b) when a < b and actual in a..b do
    answer = div(b, 2)
    IO.puts "Is it #{answer}"
    guess(actual, a..b, answer)
  end

  def guess(actual, a..b, x) when actual < x do
    to = div(a + b, 2)
    answer = div(a + to, 2)
    IO.puts "Is it #{answer}"
    guess(actual, a..to, answer)
  end

  def guess(actual, a..b, x) when actual > x do
    from = div(a + b, 2)
    answer = div(from + b, 2)
    IO.puts "Is it #{answer}"
    guess(actual, from..b, answer)
  end

  def guess(actual, _.._, x) when actual === x do
    IO.puts "#{x}"
  end

end

Chop.guess(273, 1..1000)
