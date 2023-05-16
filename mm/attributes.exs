defmodule Example do
  @author "kimlog"
  def get_author do
    @author
  end
  @author "someone"
  def get_author2 do
    @author
  end
end

IO.puts Example.get_author()
IO.puts Example.get_author2()
