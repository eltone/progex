fizz_buzzer = fn
	{0, 0, _} -> "FizzBuzz"
	{0, _, _} -> "Fizz"
	{_, 0, _} -> "Buzz"
	{_, _, x} -> x
end

checker = fn (n) -> fizz_buzzer.({rem(n, 3), rem(n, 5), n}) end

IO.puts checker.(10)
IO.puts checker.(11)
IO.puts checker.(12)
IO.puts checker.(13)
IO.puts checker.(14)
IO.puts checker.(15)
IO.puts checker.(16)
