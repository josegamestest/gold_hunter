gold_hunter = {}
minetest.register_craftitem("gold_hunter:spear_hook_item", {
  description = "spear_hook_item",
  inventory_image = "hook.png",
  stack_max = 300,
  on_use =
    function(_, player, pointed_thing, pos)
      local throw_starting_pos = vector.add({x=0, y=1.5, z=0}, player:get_pos())
      local esperalda_teleport = minetest.add_entity(throw_starting_pos, "gold_hunter:hook_entity", player:get_player_name())
	 --local pos= player:get_pos()
      minetest.after(0, function() player:get_inventory():remove_item("main", "gold_hunter:spear_hook_item") end)
		minetest.sound_play("to_throw", {pos=pos, gain = 1.0, max_hear_distance = 3})
    end,
})

local hook_entity = {
	groups = {not_in_creative_inventory=1},
  initial_properties = {
    hp_max = 1,
    physical = true,
    collide_with_objects = false,
    collisionbox = {-0.2, -0.2, -0.2, 0.2, 0.2, 0.2},
    visual = "wielditem",
    visual_size = {x = 0.4, y = 0.4},
    textures = {"gold_hunter:spear_hook_item"},
    spritediv = {x = 1, y = 1},
    initial_sprite_basepos = {x = 0, y = 0},
    pointable = false,

    speed = 15, gravity = 16,
	damage = 0,
    lifetime = 10
  },
  player_name = ""
}

function hook_entity:on_step(dtime, moveresult)  
  local collided_with_node = moveresult.collisions[1] and moveresult.collisions[1].type == "node"

  if collided_with_node then
	local position = self.object:get_pos()
	minetest.set_node(position, {name = "gold_hunter:hook_claw"})
	minetest.sound_play("hook_clipe", {pos=position, gain = 1.0, max_hear_distance = 10})
    self.object:remove()
  end
end

function hook_entity:on_activate(staticdata)
  if not staticdata or not minetest.get_player_by_name(staticdata) then
    self.object:remove()
    return
  end
  self.player_name = staticdata
  local player = minetest.get_player_by_name(staticdata)
  local yaw = player:get_look_horizontal()
  local pitch = player:get_look_vertical()
  local dir = player:get_look_dir()

  self.object:set_rotation({x = -pitch, y = yaw, z = 0})
  self.object:set_velocity({
      x=(dir.x * self.initial_properties.speed),
      y=(dir.y * self.initial_properties.speed),
      z=(dir.z * self.initial_properties.speed),
  })
  self.object:set_acceleration({x=dir.x*-4, y=-self.initial_properties.gravity, z=dir.z*-4})
  minetest.after(self.initial_properties.lifetime, function() self.object:remove() end)
end

minetest.register_entity("gold_hunter:hook_entity", hook_entity)

minetest.register_node("gold_hunter:hook_claw", {
  description = "hook_claw",
  sunlight_propagates = true,
	walkable = false,
	climbable = true,
	paramtype = "light",
	drawtype = "plantlike",
	tiles = {"hook.png"},
	drop="gold_hunter:spear_hook_item",
	paramtype2 = "wallmounted",
groups = {snappy = 3,  grass = 1, junglegrass = 1, attached_node=1,not_in_creative_inventory=1},

on_construct = function(pos)  rope_construir(pos)  end,
--after_destruct = function(pos)  rope_destruir(pos) end,
})
 
minetest.register_node("gold_hunter:rope", {
	description = ("rope"),
	drawtype = "plantlike",
	tiles = {"rope.png"},
	inventory_image = "rope.png",
	wield_image = "rope.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	pointable = false,
	diggable = false,
	buildable_to = false,
	floodable = false,
	pointable = true,
	diggable = true,
	drop="",

	--selection_box = {type = "wallmounted",},
	groups = {snappy = 3, flora = 1,not_in_creative_inventory=1, attached_node=1},
	
	on_construct = function(pos)  rope_construir(pos)  end,
	--after_destruct = function(pos)  rope_destruir(pos) end
})


function rope_construir(pos) 
	local position = vector.add(pos, {x = 0, y =-1, z = 0})
	if  minetest.get_node(position).name == "air" then
		minetest.set_node(position, {name="gold_hunter:rope"})
	end
end

function rope_destruir(pos) 
	local position = vector.add(pos, {x = 0, y =-1, z = 0})
	if  minetest.get_node(position).name == "gold_hunter:rope" then
		minetest.remove_node(position)
		end 
end