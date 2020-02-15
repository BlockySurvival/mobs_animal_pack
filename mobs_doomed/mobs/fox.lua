mobs:register_mob("mobs_doomed:fox", {
	type = "animal",
	attacks_monsters = true,
	reach = 1,
	damage = 2,
	attack_type = "dogfight",
	specific_attack = {
		"mobs_animal:chicken",
		"mobs_better_rat:rat",
		"mobs_animal:rat",
		"mobs_animal:kitten",
	},
	hp_min = 42,
	hp_max = 52,
	armor = 130,
	collisionbox = {-0.4, -0.6, -0.4, 0.3, 0.3, 0.3},
	runaway = true,
	pathfinding = true,
	visual = "mesh",
	mesh = "fox.b3d",
	textures = {
		{"mobs_doomed_fox.png"},
	},
	blood_texture = "mobs_blood.png",
	visual_size = {x=1.5, y=1.5},
	makes_footstep_sound = true,
	walk_velocity = 1,
	run_velocity = 2.5,
	jump = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 1},
	},
	water_damage = 0,
	lava_damage = 2,
	light_damage = 0,
	fall_damage = 1,
	fear_height = 4,
	replace_rate = 10,
	view_range = 14,
	animation = {
		speed_normal = 6,
		speed_run = 15,
		walk_start = 25,
		walk_end = 35,
		stand_start = 51,
		stand_end = 60,
		run_start = 1,
		run_end = 16,
		punch_start = 36,
		punch_end = 51,
	},
	follow = {
		"mobs_better_rat:rat",
		"mobs_animal:rat",
		"mobs_animal:kitten",
		"mobs_animal:kitten_set",
		"mobs_animal:chicken",
		"mobs_animal:chicken_set",
		"mobs:egg",
	},
	on_rightclick = function(self, clicker)
		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 0, 5, 50, false, nil) then return end
	end,
})

mobs:register_egg("mobs_doomed:fox", "Fox", "wool_orange.png", 1)

local l_spawn_enabled_fox = minetest.settings:get_bool("mobs_doomed.spawn_enabled_fox", true)
if l_spawn_enabled_fox then

local l_spawn_on_fox = mobs_doomed.CSVtoTable(minetest.settings:get("mobs_doomed.spawn_on_fox")) or {
						"default:dirt_with_grass",
						"default:dirt",
						"default:dirt_with_coniferous_litter",
						"default:dirt_with_snow"
					}
local l_spawn_near_fox = mobs_doomed.CSVtoTable(minetest.settings:get("mobs_doomed.spawn_near_fox")) or {"air"}
local l_spawn_min_light_fox = minetest.settings:get("mobs_doomed.spawn_min_light_fox") or 0
local l_spawn_max_light_fox = minetest.settings:get("mobs_doomed.spawn_max_light_fox") or 14
local l_spawn_interval_fox = minetest.settings:get("mobs_doomed.spawn_interval_fox") or 30
local l_spawn_chance_fox = minetest.settings:get("mobs_doomed.spawn_chance_fox") or 300000
local l_spawn_active_object_count_fox = minetest.settings:get("mobs_doomed.spawn_active_object_count_fox") or 2
local l_spawn_min_height_fox = minetest.settings:get("mobs_doomed.spawn_min_height_fox") or 0
local l_spawn_max_height_fox = minetest.settings:get("mobs_doomed.spawn_max_height_fox") or 5000

mobs:spawn_specific("mobs_doomed:fox", l_spawn_on_fox, l_spawn_near_fox, l_spawn_min_light_fox, l_spawn_max_light_fox, l_spawn_interval_fox, l_spawn_chance_fox, l_spawn_active_object_count_fox, l_spawn_min_height_fox, l_spawn_max_height_fox, nil)
end
