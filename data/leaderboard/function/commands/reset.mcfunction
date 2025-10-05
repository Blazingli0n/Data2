##
 # reset.mcfunction
 # lb
 #
 # Created by DJT3.
##
scoreboard objectives add leaderboard dummy

scoreboard players set #const.-1 leaderboard -1
scoreboard players set #const.1 leaderboard 1
scoreboard players set #const.2 leaderboard 2
scoreboard players set #const.3 leaderboard 3
scoreboard players set #const.5 leaderboard 5
scoreboard players set #const.10 leaderboard 10
scoreboard players set #const.20 leaderboard 20
scoreboard players set #const.60 leaderboard 60
scoreboard players set #const.100 leaderboard 100

scoreboard players set #bool.currency_is_negative leaderboard 0
scoreboard players set #bool.currency_minor_pad leaderboard 0
scoreboard players set #int.currency_major leaderboard 0
scoreboard players set #int.currency_minor leaderboard 0

# init time_mode storage
data modify storage leaderboard:line value_0 set value 0
data modify storage leaderboard:line value_1 set value 0
data modify storage leaderboard:line value_2 set value 0
data modify storage leaderboard:line value_3 set value 0
data modify storage leaderboard:line currency_major set value 0
data modify storage leaderboard:line currency_minor set value 0
data modify storage leaderboard:line currency_minor_pad set value 0
data modify storage leaderboard:line currency_negative set value 0

kill @e[type=minecraft:text_display,tag=leaderboard,tag=!top]
kill 00000070-0000-006e-0000-007400000078

schedule function leaderboard:lb/update_all_init 1s replace
tellraw @a ["",{"text":"Leaderboards ","color":"gold"},{"text":"datapack "},{"text":"loaded","color":"green"}]