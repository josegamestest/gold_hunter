--Player chest hold items
--Itens para segurar o baú do jogador
minetest.register_node("gold_hunter:gold_hunter_golden_box", {
    description=("gold_hunter_golden_box"),
	tiles = {"gold_hunter_top.png", "gold_hunter_top.png", "gold_hunter_side.png",
             "gold_hunter_side.png", "gold_hunter_back.png", "gold_hunter_front.png"},
	paramtype2 = "facedir",
	groups = {snappy=2, choppy=2, oddly_breakable_by_hand=2,},
	legacy_facedir_simple = true,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec",
				"size[8,9]"..
				default.gui_bg ..
				default.gui_bg_img ..
				default.gui_slots ..
				"list[current_player;gold_hunter:gold_hunter;0,0.3;8,4;]"..
				"list[current_player;main;0,4.85;8,1;]" ..
				"list[current_player;main;0,6.08;8,3;8]" ..
				"listring[current_player;gold_hunter:gold_hunter]" ..
				"listring[current_player;main]" ..
				default.get_hotbar_bg(0,4.85))
	end,

    after_place_node = function(pos, placer)
			local meta = minetest.get_meta(pos)
			meta:set_string("infotext",placer:get_player_name().."'s golden_box" or "")
		end,
})
--chest recipes
--receitas do baú
minetest.register_craft({
		output = 'gold_hunter:gold_hunter',
		recipe = {
			{'default:obsidian_block','default:obsidian_block','default:obsidian_block'},
			{'default:obsidian_block','','default:obsidian_block'},
			{'default:obsidian_block','default:obsidian_block','default:obsidian_block'}
		}
	})
--player inv
--inv do jogador
minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("gold_hunter:gold_hunter", 8*4)
end)
