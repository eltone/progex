defmodule Chop do
  def guess(actual, first..last) do
  	g = div(first + last, 2)
  	IO.puts "Is it #{g}?"
  	check_guess(actual, g, first..last)
  end

  defp check_guess(actual, current_guess, first.._) when current_guess > actual do
  	guess(actual, first..(current_guess - 1))
  end

  defp check_guess(actual, current_guess, _..last) when current_guess < actual do
  	guess(actual, (current_guess + 1)..last)
  end

  defp check_guess(actual, current_guess, _) when actual == current_guess do
  	current_guess
  end
end
