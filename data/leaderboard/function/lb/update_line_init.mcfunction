##
 # update_line_init.mcfunction
 # 
 #
 # Created by DJT3.
##
execute unless data storage leaderboard:leaderboard_nbt {data:{time_mode:0}} as @s run function leaderboard:lb/build_time_values with storage leaderboard:line
data modify storage leaderboard:line color set value "white"
$execute if data storage leaderboard:leaderboard_nbt {data:{medal_color:1}} if score #const.1 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#D6AF36"
$execute if data storage leaderboard:leaderboard_nbt {data:{medal_color:1}} if score #const.2 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A7A7AD"
$execute if data storage leaderboard:leaderboard_nbt {data:{medal_color:1}} if score #const.3 leaderboard matches $(rank) run data modify storage leaderboard:line color set value "#A77044"

data modify storage leaderboard:line bold_name set value "false"
data modify storage leaderboard:line close_background set value 1
$data modify storage leaderboard:line currency_major set value 0
$data modify storage leaderboard:line currency_minor set value 0
$data modify storage leaderboard:line currency_minor_pad set value 0
$data modify storage leaderboard:line currency_negative set value 0
scoreboard players set #bool.currency_is_negative leaderboard 0
scoreboard players set #bool.currency_minor_pad leaderboard 0
$execute at @s if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line bold_name set value "true"
$execute at @s if data storage leaderboard:leaderboard_nbt {data:{always_show_closest_player:1}} if entity @p[distance=..10,name='$(name)'] run data modify storage leaderboard:line close_background set value 0

$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} run scoreboard players operation #int.value leaderboard = $(name) $(score)
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} unless score #int.value leaderboard matches 0.. run scoreboard players set #bool.currency_is_negative leaderboard 1
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} if score #int.value leaderboard matches 0.. run scoreboard players set #bool.currency_is_negative leaderboard 0
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} unless score #int.value leaderboard matches 0.. run scoreboard players operation #int.value leaderboard *= #const.-1 leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} run scoreboard players operation #int.currency_major leaderboard = #int.value leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} run scoreboard players operation #int.currency_major leaderboard /= #const.100 leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} run scoreboard players operation #int.currency_minor leaderboard = #int.value leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} run scoreboard players operation #int.currency_minor leaderboard %= #const.100 leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} if score #int.currency_minor leaderboard < #const.10 leaderboard run scoreboard players set #bool.currency_minor_pad leaderboard 1
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} unless score #int.currency_minor leaderboard < #const.10 leaderboard run scoreboard players set #bool.currency_minor_pad leaderboard 0
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} store result storage leaderboard:line currency_major int 1 run scoreboard players get #int.currency_major leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} store result storage leaderboard:line currency_minor int 1 run scoreboard players get #int.currency_minor leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} store result storage leaderboard:line currency_minor_pad int 1 run scoreboard players get #bool.currency_minor_pad leaderboard
$execute if data storage leaderboard:leaderboard_nbt {data:{currency_mode:1}} store result storage leaderboard:line currency_negative int 1 run scoreboard players get #bool.currency_is_negative leaderboard

$execute store result storage leaderboard:line value int 1 run scoreboard players get $(name) $(score)
$execute at @s as @e[type=text_display,limit=1,tag=!top,tag=$(lines),distance=..0.001] run function leaderboard:lb/line_text_build with storage leaderboard:line