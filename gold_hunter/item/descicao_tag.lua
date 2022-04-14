descicao_tag={}

local ano=tonumber(os.date("%Y"))
local mes=tonumber(os.date("%m"))
local dia = tonumber(os.date("%d"))
--pega hora sistema
local hora =tonumber(os.date("%I"))
local minuto =tonumber(os.date("%M"))
local segundo =tonumber(os.date("%S"))
-----------------------------------------------------------------
local nome="Cedany Mistsplitter\n"
local especie="É uma humana\n"
local idade=" 34 anos\n"
local cabelos=" curtos, lisos e ruivos\n"
local olhos=" verdes.\n"
local pele=" branca e lisa\n"
local altura=" 167cm5'5\n"
local constituicao="magra\n"
local rosto="Rosto: quadrado e bonito\n"

local descricao=
	core.colorize("#000","Nome: ")..core.colorize("#fff",""..nome)..
	core.colorize("#000","Especie: ")..core.colorize("#fff",""..especie)..
	core.colorize("#000","Idade: ")..core.colorize("#fff",""..idade)..
	core.colorize("#000","Cabelos: ")..core.colorize("#fff",""..cabelos)..
	core.colorize("#000","Olhos: ")..core.colorize("#fff",""..olhos)..
	core.colorize("#000","Pele: ")..core.colorize("#fff",""..pele)..
	core.colorize("#000","Altura: ")..core.colorize("#fff",""..altura)..
	core.colorize("#000","Constituição: ")..core.colorize("#fff",""..constituicao)..
	core.colorize("#000","Rosto ")..core.colorize("#fff",""..rosto)

---------------------------------------------------------------------------------------------------------	

--minetest.chat_send_player(jogador,frases[math.random(1,7)][2]);
mensagem=descricao.."\n ♥♥♥ Ola eu me chamo cedany_mistsplitter,\n o mestre das floresta esta vindo para destruir \n os humanos precisamos de um herói que o derrote pra nos,\nse caso enfrentá-lo e retornar com um aprova que o\nderrotou eu lhe darei um presente em troca\ndo item, Não ha valor no item que me trara,\n porem sera uma prova de minha gratidão por \n salvar meu povo da destruição\nque estar por vir ♥♥♥";


local name_tag = {
	groups = {not_in_creative_inventory=0},
  initial_properties = {
	nametag=mensagem,
    hp_max = 1,
    physical = true,
    collide_with_objects = false,
    collisionbox = {-0.2, -0.2, -0.2, 0.2, 0.2, 0.2},
    visual = "wielditem",
    visual_size = {x = 0.1, y = 0.1},
    textures = {"gold_hunter:spear_hook_item"},
    spritediv = {x = 1, y = 1},
    initial_sprite_basepos = {x = 0, y = 0},
    pointable = false,
	glow= 8,
    speed = 15, gravity = 16,
	damage = 0,
    lifetime = 10,
	
  },
  player_name = ""
}

minetest.register_entity("gold_hunter:name_tag", name_tag)

