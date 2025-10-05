##
 # init.mcfunction
 # currency
 #
 # Initializes the money scoreboard used for currency leaderboards.
##
scoreboard objectives add money dummy "Money"
data modify storage leaderboard:currency_call amount set value 0
