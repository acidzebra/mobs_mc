--License for code WTFPL and otherwise stated in readmes

-- intllib
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

--dofile(minetest.get_modpath("mobs").."/api.lua")

--###################
--################### POLARBEAR
--###################


mobs:register_mob("mobs_mc:brown_bear", {
	type = "animal",
	runaway = false,
	passive = false,
	stepheight = 1.2,
	hp_min = 60,
	hp_max = 70,
	collisionbox = {-0.7, -0.01, -0.7, 0.7, 1.39, 0.7},
	visual = "mesh",
	mesh = "mobs_mc_polarbear.b3d",
	textures = {
		{"mobs_mc_brownbear.png"},
	},
	visual_size = {x=3.0, y=3.0},
	makes_footstep_sound = true,
	damage = 6,
	reach = 2,
	walk_velocity = 1.2,
	run_velocity = 2.3,
	attack_animals = true,
	attack_monsters = true,
	specific_attack = {"dmobs:fox", "mobs_mc:chicken", "mobs_mc:wolf", "mobs_mc:pig", "mobs_mc:sheep", "mobs_mc:rabbit"},
	group_attack = true,
	attack_type = "dogfight",
	drops = {
		-- 3/4 chance to drop raw fish (poor approximation)
		{name = mobs_mc.items.fish_raw,
		chance = 2,
		min = 0,
		max = 2,},		
		-- 1/4 to drop raw salmon
		{name = mobs_mc.items.salmon_raw,
		chance = 4,
		min = 0,
		max = 2,},

	},
	water_damage = 0,
	floats = 1,
	lava_damage = 5,
	light_damage = 0,
	fear_height = 2,
	sounds = {
		random = "Cowhurt1", -- TODO: Replace
		distance = 16,
	},
	animation = {
		speed_normal = 25,		speed_run = 50,
		stand_start = 0,		stand_end = 0,
		walk_start = 0,		walk_end = 40,
		run_start = 0,		run_end = 40,
	},

	view_range = 10,
})


-- compatibility
mobs:alias_mob("mobs_mc:brownbear", "mobs_mc:brown_bear")


mobs:spawn_specific("mobs_mc:brown_bear", mobs_mc.spawn.forest, {"air"}, 0, minetest.LIGHT_MAX+1, 30, 7000, 3, mobs_mc.spawn_height.overworld_min, mobs_mc.spawn_height.overworld_max)

-- spawn egg
mobs:register_egg("mobs_mc:brown_bear", S("Brown Bear"), "mobs_mc_spawn_icon_polarbear.png", 0)


if minetest.settings:get_bool("log_mods") then
	minetest.log("action", "MC Brown Bear loaded")
end
