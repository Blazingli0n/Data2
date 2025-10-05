##
 # show_usage.mcfunction
 # currency
 #
 # Displays usage instructions when the currency helper functions are invoked without an amount payload.
##
execute if entity @s[type=minecraft:player] run tellraw @s [{"text":"Currency helper requires an amount of cents.","color":"red"},{"text":" Example: ","color":"gray"},{"text":"/execute as <player> run function leaderboard:currency/add with storage leaderboard:currency_call {amount:1234}","color":"gold"}]
execute unless entity @s[type=minecraft:player] run tellraw @a[limit=1,sort=nearest] [{"text":"Currency helper requires an amount of cents.","color":"red"},{"text":" Example: ","color":"gray"},{"text":"/execute as <player> run function leaderboard:currency/add with storage leaderboard:currency_call {amount:1234}","color":"gold"}]
