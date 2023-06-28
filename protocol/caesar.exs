defprotocol Caesar do
  def encrypt(string, shift)
  def rot13(string)
end

defimpl Caesar, for: List do
  def encrypt(string, shift) do
    string 
    |> Enum.map(fn ch -> ?a + rem(ch - ?a + shift, 26) end)
  end

  def rot13(string) do
    string |> encrypt(13)
  end
end

defimpl Caesar, for: BitString do
  def encrypt(string, shift) do
    String.to_charlist(string)
    |> Enum.map(fn ch -> ?a + rem(ch - ?a + shift, 26) end)
    |> List.to_string()
  end

  def rot13(string) do
    string |> encrypt(13)
  end
end

IO.puts Caesar.encrypt('ryvkve', 13)
IO.puts Caesar.rot13('ryvkve')

IO.puts Caesar.encrypt("ryvkve", 13)
IO.puts Caesar.rot13("ryvkve")
