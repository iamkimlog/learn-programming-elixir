cast = [
  %{
    character: "Buttercup",
    actor: %{
      first: "Robin",
      last: "Wright"
    },
    role: "princess"
  },
  %{
    character: "Westley",
    actor: %{
      first: "Cary",
      last: "Elwes"
    },
    role: "farm boy"
  },
]

# all, at 은 리스트에만 사용 가능
# at 은 0번째 부터 시작한다

IO.inspect get_in(cast, [Access.all(), :character]) # ["Buttercup", "Westley"]
IO.inspect get_in(cast, [Access.at(1), :role])

IO.inspect get_and_update_in(cast, [Access.all(), :actor, :last], fn (val) -> {val, String.upcase(val)} end)
