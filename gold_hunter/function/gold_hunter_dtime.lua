local seconds = 0
--funcao delta_time do objecto destribuidor de ouro no mapa
--gold distributor object delta time function on map
function gold_hunter_gold_dtime(self,pos,dtime)
	local position = self.object:get_pos()
	local distance=10
		position.z = position.z+math.random(-distance, distance)
		position.y = position.y+math.random(3, distance*2)
		position.x = position.x+math.random(-distance, distance)
		local node = minetest.get_node(position)
		if node.name == "air"then
			minetest.add_entity(position, "gold_hunter:gold_hunter_gold")
				minetest.get_node_timer(position):start(4.5)
		else minetest.chat_send_all("Place is not free to put")
		minetest.get_node_timer(position):start(4.5)
		end
end

	
function gold_hunter_timer_reativa(self, dtime)
	if seconds<=50 then seconds = seconds+1 end
end


function gold_hunter_desativa(hitter,player, pointed_thing, pos)
		seconds=0
end

