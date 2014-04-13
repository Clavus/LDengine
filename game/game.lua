
local playState = require("game/gamestate_play")
local menuState = require("game/gamestate_menu")

function game.load()

	gamestate.set( playState )
	
	print(table.toString( package.loaded, "package.loaded", true, 1 ))
	
end

function game.update( dt )
	
	if (input:keyIsPressed("escape")) then love.event.quit() return end
	if (input:keyIsPressed("r")) then 
		util.hotswap("game/classes/spaceship")
		print(table.toString( package.loaded, "package.loaded", true, 1 ))
	return end
	
	gamestate.update( dt )
	
end

function game.draw()
	
	gamestate.drawStack()
	
end

function game.handleTrigger( trigger, other, contact, trigger_type, ...)
	
	-- function called by Trigger entities upon triggering. Return true to disable the trigger.
	return gamestate.handleTrigger( trigger, other, contact, trigger_type, ...)
	
end