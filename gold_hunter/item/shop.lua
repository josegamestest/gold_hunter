--[[on_use = 
    function(_, player, pointed_thing, pos)
                                                         
      player:set_properties({ 
			mesh = itens[i][2],
			textures = {itens[i][3]},
			collisionbox ={-0.3,0.0,-0.3, 0.3,0.8,0.3},
			armor_groups = {fleshy="100"},
	})
	player:set_physics_override({ gravity =itens[i][4], speed=itens[i][5], jump=itens[i][6], sneak=itens[i][7],})
	
end,]]

--[[local itens={{"gold_hunter_wing"},
             {"gold_hunter_wing2"},
             {"gold_hunter_emerald"},
             {"gold_hunter_emerald2"},
             }]]
--						1					2						3							 4			5	6		 7      8
--						name,     		model.b3d					img							gravit 	speed   jump	 sneak fleshy
local itens={{"gold_hunter_wing",		"wings.b3d",				"gold_hunter_wings.png",	"0.1",	"1.0",	"1.0",	 true,	"100"},
             {"gold_hunter_wing2",		"wings.b3d",				"gold_hunter_wings2.png",	"0.1",	"1.0",	"1.0",	 true,	"100"},
             {"gold_hunter_emerald",	"gold_hunter_boneco.b3d",	"gold_hunter_boneco.png",	"10",	"0.8",	"0",	 true,	"100"},
             --{"gold_hunter_emerald2",	"gold_hunter_boneco.b3d",	"gold_hunter_boneco2.png",	"10",	"0.3",	"0",	 true,	"100"},
             {"gold_hunter_emerald2",	"gold_hunter_boneco.b3d",	"gold_hunter_boneco2.png",	"5",	"0.3",	"0",	 true,	"100"},
             }

wings = {}

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

for i = 1, #itens, 1 do
minetest.register_craftitem("gold_hunter:"..itens[i][1], {
	description = itens[i][1],
	inventory_image = itens[i][1]..".png",
	stack_max = 3,
})

local shop_spawn=false

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
minetest.register_node("gold_hunter:shop_"..itens[i][1], {
    description = "shop_"..itens[i][1],
    ight_source = 5,
	drawtype = "glasslike_framed_optional",
    use_texture_alpha ="clip",
    sunlight_propagates = true,
    paramtype2 = "facedir",
	tiles = {itens[i][1]..".png"},
    paramtype = "light",
    pathfinding= false,
    groups = {cracky=3,oddly_breakable_by_hand=3,torch=1, not_in_creative_inventory=0},
	on_rightclick = function(pos, node, clicker)
		local position = clicker:get_pos() position.y = position.y+1
		local node = minetest.get_node(position)
		local posicao = vector.add(pos, {x = 0, y =1, z = 0})
		
	if shop_spawn==false then 
		shop_spawn=true
	
    if node.name == "air"then
		if position == nil then return end
		for _, ob in pairs(minetest.get_objects_inside_radius(posicao, 1)) do
			if not ob:is_player() and (not entity or not entity.name:find()) then 
				ob:remove() end end
				minetest.sound_play("enabled", {pos=position, gain = 1.0, max_hear_distance = 10})
				minetest.add_entity(posicao, "gold_hunter:shop_spawn_entity_"..itens[i][1])
				minetest.get_node_timer(position):start(4.5)
			end 
	
	else if shop_spawn==true then
			shop_spawn=false
			if position == nil then return end
		for _, ob in pairs(minetest.get_objects_inside_radius(posicao, 1)) do
			if not ob:is_player() and (not entity or not entity.name:find()) then 
				minetest.sound_play("disabled", {pos=position, gain = 1.0, max_hear_distance = 10})
				ob:remove() 
			end 
		end
    end
end 
end,
})

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
minetest.register_entity("gold_hunter:shop_spawn_entity_"..itens[i][1],{
	groups = {not_in_creative_inventory=1},
  
    hp_max = 20,
    physical = false,
    collide_with_objects = false,
    collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
    visual = "wielditem",
    visual_size = {x = 0.4, y = 0.4},
    textures = {"gold_hunter:"..itens[i][1]},
    spritediv = {x = 1, y = 1},
    initial_sprite_basepos = {x = 0, y = 0},
    pointable = true,
	glow= 8,
    speed = 15, gravity = 16,
	damage = 0,
    lifetime = 10,
	automatic_rotate =3,
			--name,     		G=Gravit			S=Speed   			J=Jump			 	F=Fleshy
			--1					4					5			 			6	 	8
	infotext=itens[i][1].." [ G:"..itens[i][4].." S:"..itens[i][5].." J:"..itens[i][6].." F:"..itens[i][8].." ]",
on_rightclick = function(self, clicker,rot,jogador,pos)
	--self.object:set_properties({infotext=itens[i][1]})
	if not clicker or not clicker:is_player() then return end
    jogador=clicker:get_player_name()
        local inv = clicker:get_inventory()
	minetest.sound_play("catch3", {pos=pos, gain = 1.0, max_hear_distance = 3})
		inv:add_item("main", "gold_hunter:"..itens[i][1].." 1")
end,

})
end

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------

--shop
local shop_spawn=false
minetest.register_node("gold_hunter:shop_hook", {
    description = "shop_hook",
    ight_source = 5,
    use_texture_alpha ="clip",
    sunlight_propagates = true,
	drawtype = "glasslike_framed_optional",
    paramtype2 = "facedir",
	tiles = {"hook.png"},
    paramtype = "light",
    pathfinding= false,
    groups = {cracky=3,oddly_breakable_by_hand=3,torch=1, not_in_creative_inventory=0},

	on_rightclick = function(pos, node, clicker)
		local position = clicker:get_pos() position.y = position.y+1
		local node = minetest.get_node(position)
		local posicao = vector.add(pos, {x = 0, y =1, z = 0})

	if shop_spawn==false then 
		shop_spawn=true
	
    if node.name == "air"then
		for _, ob in pairs(minetest.get_objects_inside_radius(posicao, 1)) do
			if not ob:is_player() and (not entity or not entity.name:find()) then 
				ob:remove() end end
				minetest.sound_play("enabled", {pos=position, gain = 1.0, max_hear_distance = 10})
				minetest.add_entity(posicao, "gold_hunter:shop_spawn_entity_hook")
				minetest.get_node_timer(position):start(4.5)
			end 
	
	else if shop_spawn==true then
			shop_spawn=false
		for _, ob in pairs(minetest.get_objects_inside_radius(posicao, 1)) do
			if not ob:is_player() and (not entity or not entity.name:find()) then 
				minetest.sound_play("disabled", {pos=position, gain = 1.0, max_hear_distance = 10})
				ob:remove() 
			end 
		end
    end
end 
end,
})

---------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------
minetest.register_entity("gold_hunter:shop_spawn_entity_hook",{
	groups = {not_in_creative_inventory=1},
  
    hp_max = 20,
    physical = false,
    collide_with_objects = false,
    collisionbox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
    visual = "wielditem",
    visual_size = {x = 0.4, y = 0.4},
    textures = {"gold_hunter:spear_hook_item"},
    spritediv = {x = 1, y = 1},
    initial_sprite_basepos = {x = 0, y = 0},
    pointable = true,
	glow= 8,
    speed = 15, gravity = 16,
	damage = 0,
    lifetime = 10,
	--automatic_rotate=1,
	automatic_rotate =3,
on_rightclick = function(self, clicker,rot,jogador,pos)
	if not clicker or not clicker:is_player() then return end
    jogador=clicker:get_player_name()
        local inv = clicker:get_inventory()
		inv:add_item("main", "gold_hunter:spear_hook_item 1")
		minetest.sound_play("catch3", {pos=pos, gain = 1.0, max_hear_distance = 3})
end,

})
