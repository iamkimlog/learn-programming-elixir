fizzbuzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, x) -> x
end

# IO.puts fizzbuzz.(0, 0, 3)
# IO.puts fizzbuzz.(0, 3, 3)
# IO.puts fizzbuzz.(3, 0, 3)
# IO.puts fizzbuzz.(1, 2, 3)

use_fizzbuzz = fn n -> fizzbuzz.(rem(n, 3), rem(n, 5), n) end

IO.puts use_fizzbuzz.(10)
IO.puts use_fizzbuzz.(11)
IO.puts use_fizzbuzz.(12)
IO.puts use_fizzbuzz.(13)
IO.puts use_fizzbuzz.(14)
IO.puts use_fizzbuzz.(15)
IO.puts use_fizzbuzz.(16)
