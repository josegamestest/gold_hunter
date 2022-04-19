--						1					2						3							 4			5	6		 7      8
--						name,     		model.b3d					img							gravit 	speed   jump	 sneak fleshy
local itens={{"gold_hunter_wing",		"wings.b3d",				"gold_hunter_wings.png",	"0.1",	"1.0",	"1.0",	 true,	"100"},
             {"gold_hunter_wing2",		"wings.b3d",				"gold_hunter_wings2.png",	"0.1",	"1.0",	"1.0",	 true,	"100"},
             {"gold_hunter_emerald",	"gold_hunter_boneco.b3d",	"gold_hunter_boneco.png",	"10",	"0.8",	"0",	 true,	"100"},
             --{"gold_hunter_emerald2",	"gold_hunter_boneco.b3d",	"gold_hunter_boneco2.png",	"10",	"0.3",	"0",	 true,	"100"},
             {"gold_hunter_emerald2",	"gold_hunter_boneco.b3d",	"gold_hunter_boneco2.png",	"5",	"0.3",	"0",	 true,	"100"},
             }
wings = {}

function gold_hunter_hit(self, hitter)
		if not hitter or not hitter:is_player() then return end
		local tool = hitter:get_wielded_item()
		local item = tool:get_name()
		local name = hitter:get_player_name()

		hitter:get_inventory():remove_item("main", item)
		minetest.sound_play("transformation", {pos=pos, gain = 1.0, max_hear_distance = 3})
		--gold_hunter_wing
		if item=="gold_hunter:gold_hunter_wing" then
				hitter:set_properties({ 
					mesh = itens[1][2],
					textures = {itens[1][3]},
					collisionbox ={-0.3,0.0,-0.3, 0.3,0.8,0.3},
					armor_groups = {fleshy=itens[1][8]},
					visual_size={x = 1, y = 1},
					eye_height = 1.47,
				})
				hitter:set_physics_override({ gravity =itens[1][4], speed=itens[1][5], jump=itens[1][6], sneak=itens[1][7],})

		--gold_hunter_wing2
		else if item=="gold_hunter:gold_hunter_wing2" then
				hitter:set_properties({ 
					mesh = itens[2][2],
					textures = {itens[2][3]},
					collisionbox ={-0.3,0.0,-0.3, 0.3,0.8,0.3},
					armor_groups = {fleshy=itens[2][8]},
					visual_size={x = 1, y = 1},
					eye_height = 1.47,
				})
				hitter:set_physics_override({ gravity =itens[2][4], speed=itens[2][5], jump=itens[2][6], sneak=itens[2][7],})	

		--gold_hunter_emerald
		else if item=="gold_hunter:gold_hunter_emerald" then
				hitter:set_properties({ 
					mesh = itens[3][2],
					textures = {itens[3][3]},
					collisionbox ={-0.1,0.0,-0.1, 0.1,0.2,0.1},
					visual_size={x = 0.4, y = 0.4},
					armor_groups = {fleshy=itens[3][8]},
					eye_height = 0.47,
				})
				hitter:set_physics_override({ gravity =itens[3][4], speed=itens[3][5], jump=itens[3][6], sneak=itens[3][7],})
		--gold_hunter_emerald
		else if item=="gold_hunter:gold_hunter_emerald2" then
				hitter:set_properties({ 
					mesh = itens[4][2],
					textures = {itens[4][3]},
					collisionbox ={-0.1,0.0,-0.1, 0.1,0.2,0.1},
					visual_size={x = 0.4, y = 0.4},
					armor_groups = {fleshy=itens[4][8]},
					eye_height = 0.47,
				})
				hitter:set_physics_override({ gravity =itens[4][4], speed=itens[4][5], jump=itens[4][6], sneak=itens[4][7],})
		else
		--Normal
			hitter:set_properties({ 
				mesh = "character.b3d",
				textures = {"character.png"},
				collisionbox = {-0.3, 0.0, -0.3, 0.3, 1.7, 0.3},
				visual_size={x = 1, y = 1},
				armor_groups = {fleshy="100"},
				eye_height = 1.47,
			})
			hitter:set_physics_override({ gravity =1.0, speed=1.0, jump=1.0, sneak=true,})

		end
		end
		end
		end
end 
