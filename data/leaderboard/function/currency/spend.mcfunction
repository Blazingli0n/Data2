##
 # spend.mcfunction
 # currency
 #
 # Subtracts the specified amount of cents from storage leaderboard:currency_call from the executing player's money score.
##
execute unless data storage leaderboard:currency_call {amount:} run function leaderboard:currency/show_usage
execute if data storage leaderboard:currency_call {amount:} run scoreboard players set #int.currency_amount leaderboard 0
execute if data storage leaderboard:currency_call {amount:} store result score #int.currency_amount leaderboard run data get storage leaderboard:currency_call amount 1
execute if data storage leaderboard:currency_call {amount:} run scoreboard players operation @s money -= #int.currency_amount leaderboard
