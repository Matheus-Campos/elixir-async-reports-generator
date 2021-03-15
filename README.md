# AsyncReportsGenerator

In this project, I was challenged by Rocketseat to develop a software that is able to generate reports about some employees' worked hours, to make it possible, the user must provide an input using .csv files in the following format: name,worked hours,day,month,year.

This software was built to provide the maximum capable speed of processing, using Elixir's tasks (threads) and parallelism to achieve this requirement.

## Running

1.  Just clone this repository;
2.  Download the dependencies by running `mix deps.get` (you'll need Elixir installed in your PC);
3.  Enter the interactive Elixir mode: `iex -S mix`;
4.  Call AsyncReportsGenerator.generate function, as a parameter, you must pass a list of csv file paths (input).
