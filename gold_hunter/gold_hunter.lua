local event_gold_hunter=false
local position= nil

minetest.register_chatcommand("gold_hunter", {
		params ="gold_hunter" ,
		description = "Activate gold hunter mode",
		func = function(name, param)
			local player = minetest.get_player_by_name(name)
			--position = player:get_pos()
			if event_gold_hunter==false then
					event_gold_hunter=true

			player:set_physics_override({ gravity =10.0, speed=1.0, jump=0.0, sneak=true,})
			player:set_properties({ 
                                   visual = "mesh", mesh = "gold_hunter_boneco.b3d", textures = {"gold_hunter_boneco.png"},
									collisionbox = {-0.3,0.0,-0.3, 0.3,0.8,0.3}, visual_size = {x=1, y=1},
			})

			else if event_gold_hunter==true then
					event_gold_hunter=false
					player:set_physics_override({ gravity =1.0, speed=1.0, jump=1.0, sneak=true,})
					player:set_properties({ 
                                   visual = "mesh", mesh = "character.b3d", textures = {"character.png"},
									collisionbox = {-0.3,0.0,-0.3, 0.3,0.8,0.3}, visual_size = {x=1, y=1},
			})
			end
			end
		end,
})
