function gold_hunter_gold_dtime(pos, node, clicker, itemstack)
  local name = clicker:get_player_name()
	local position = clicker:get_pos()
	
	local distance=5
	position.z = position.z+math.random(-distance, distance)
	position.y = position.y+math.random(-0, distance*2)
	position.x = position.x+math.random(-distance, distance)
    local node = minetest.get_node(position)
    if node.name == "air"then
        --minetest.set_node(position, {name = "gold_hunter:gold_hunter_gold"})
		minetest.chat_send_all("Gold placed in X:"..position.x.." Y:"..position.y.." Z:"..position.z)
		minetest.add_entity(position, "gold_hunter:gold_hunter_gold")
        minetest.get_node_timer(position):start(4.5)
	else minetest.chat_send_all("Place is not free to put")
    end
end
