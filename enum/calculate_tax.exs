defmodule CalculateTax do
  def calc(order_list, tax_rates) when is_list(order_list) and is_list(tax_rates) do
    for order <- order_list, do: order ++ [ total_amount: calc(order[:net_amount], tax_rates[order[:ship_to]])]
  end

  def calc(net_amount, nil), do: net_amount
  def calc(net_amount, tax_rate), do: net_amount * (1 + tax_rate)

  def tax_rates do
    [ NC: 0.075, TX: 0.08 ]
  end

  def orders do
    [
      [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      [ id: 124, ship_to: :OK, net_amount: 35.50 ],
      [ id: 125, ship_to: :TX, net_amount: 24.00 ],
      [ id: 126, ship_to: :TX, net_amount: 44.80 ],
      [ id: 127, ship_to: :NC, net_amount: 25.00 ],
      [ id: 128, ship_to: :MA, net_amount: 10.00 ],
      [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      [ id: 130, ship_to: :NC, net_amount: 50.00 ],
    ]
  end

end

IO.inspect CalculateTax.calc(CalculateTax.orders(), CalculateTax.tax_rates())
