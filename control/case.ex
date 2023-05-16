case File.open("./control/case.ex") do
  { :ok, file } ->
    IO.puts "first line: #{IO.read(file, :line)}"
  { :error, reason } ->
    IO.puts "failed to open file: #{reason}"
end
