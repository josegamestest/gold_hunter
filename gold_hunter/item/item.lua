local item={{"gold_hunter_gold","gold_hunter_gold.obj","gold_hunter_gold.png", "gold_hunter_gold.png",};
}

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

	on_rightclick = function(pos, node, clicker, itemstack)
		gold_hunter_gold_dtime(pos, node, clicker, itemstack)
	end,
})

minetest.register_entity("gold_hunter:gold_hunter_gold",{   --prpriedades da entidade
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
				clicker:get_inventory():add_item("main", "gold_hunter:gold_hunter_gold_igont")        
				self.object:remove()
end,
})
minetest.register_craftitem("gold_hunter:gold_hunter_gold_igont", {
	description = "gold_hunter_gold_igont", inventory_image = "gold_hunter_gold_ingot.png",
})
