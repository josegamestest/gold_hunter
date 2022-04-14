--variaveis de itens
--item variables

local item={{"gold_hunter_gold","gold_hunter_gold.obj","gold_hunter_gold.png", "gold_hunter_gold.png",};}
local gold_hunter_spawn=false
local max_iten=0

--bloco base destribuicao de ouro
--gold distribution base block
minetest.register_node("gold_hunter:gold_hunter_gold", {
    description = "gold_hunter_gold",
    ight_source = 5,
    use_texture_alpha ="clip",
    sunlight_propagates = true,
    paramtype2 = "facedir",
	tiles = {"gold_hunter_spawn.png"},
    paramtype = "light",
    pathfinding= false,
    groups = {cracky=3,oddly_breakable_by_hand=3,torch=1, not_in_creative_inventory=0},

	on_rightclick = function(pos, node, clicker)
		local position = clicker:get_pos() position.y = position.y+1
		local node = minetest.get_node(position)
		local posicao = vector.add(pos, {x = 0, y =1, z = 0})

	if gold_hunter_spawn==false then 
		gold_hunter_spawn=true
	
    if node.name == "air"then
		for _, ob in pairs(minetest.get_objects_inside_radius(posicao, 1)) do
			if not ob:is_player() and (not entity or not entity.name:find()) then 
				ob:remove() end end

				minetest.add_entity(posicao, "gold_hunter:lamp")
				minetest.get_node_timer(position):start(4.5)
			end 
	
	else if gold_hunter_spawn==true then
			gold_hunter_spawn=false
			max_iten=0
		for _, ob in pairs(minetest.get_objects_inside_radius(posicao, 1)) do
			if not ob:is_player() and (not entity or not entity.name:find()) then 
				ob:remove() 
			end 
		end
    end
end 
end,
})

------------------------------------------------------------------------------------------------------------
--objecto destribuidor de ouro no mapa
--gold dispenser object on map

minetest.register_entity("gold_hunter:lamp",{   --propriedades da entidade
	hp_max = 50,
	physical = true,
	weight = 5,
	collide_with_objects = false,
	selectionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	--visual = "cube"/"sprite"/"upright_sprite"/"mesh"/"wielditem",
	visual = "cube",
	textures = {"lamp.png","lamp.png","lamp.png","lamp.png","lamp.png","lamp.png"}, --texturas
	initial_sprite_basepos = {x=0, y=0},
	inventory_image = "lamp.png",
	is_visible = true,
	automatic_rotate = 1,
	backface_culling = false,
	player_name = "",
	drop="",
	
	on_step= function(self,pos,dtime)
		if max_iten<=10 then
			max_iten=max_iten+1
			gold_hunter_gold_dtime(self,pos,dtime)
		end
	end
}) 
------------------------------------------------------------------------------------------------------------
--lingote de ouro iten iventario
--gold ingot inventory item
minetest.register_craftitem("gold_hunter:gold_hunter_gold_igont", {
	description = "gold_hunter_gold_igont", 
	inventory_image = "gold_hunter_gold_ingot.png",
})

------------------------------------------------------------------------------------------------------------
--lingote de ouro objeto
--gold ingot object

minetest.register_entity("gold_hunter:gold_hunter_gold",{   
	hp_max = 50,
	physical = true,
	weight = 5,
	selectionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
	--visual = "cube"/"sprite"/"upright_sprite"/"mesh"/"wielditem",
	visual = "mesh",
	visual_size = {x=2, y=2},
	mesh = "gold_hunter_gold.obj",
	textures = {"gold_hunter_gold.png"}, --texturas
	initial_sprite_basepos = {x=0, y=0},
	inventory_image = "gold_hunter_gold_ingot.png",
	is_visible = true,
	automatic_rotate = 1,
	backface_culling = false,
	player_name = "",
	drop="gold_hunter:gold_hunter_gold_igont",

	on_rightclick = function(self,clicker,jogador)
				local position = self.object:get_pos()
				minetest.sound_play("catch", {pos=position, gain = 1.0, max_hear_distance = 10})
				clicker:get_inventory():add_item("main", "gold_hunter:gold_hunter_gold_igont")
				max_iten=max_iten-1
				self.object:remove()
	end,
	on_step= function(self,pos,dtime)
		if max_iten<=0 then
			self.object:remove()
		end
	end
})
