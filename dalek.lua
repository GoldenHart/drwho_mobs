
local S = mobs.intllib

mobs:register_mob("drwho_mobs:dalek", {
	type = "monster",
	passive = false,
	damage = 6,
	attack_type = "shoot",
	attacks_monsters = true,
	reach = 3,
	shoot_interval = 2.2,
	arrow = "drwho_mobs:fireball",
	shoot_offset = 1,
	hp_min = 22,
	hp_max = 45,
	armor = 60,
	collisionbox = {-0.71, -1.01, -0.71, 0.71, 1.11, 0.71},
	visual = "mesh",
	mesh = "dalek.obj",
	textures = {
		{"dalek.png"},
	},
	makes_footstep_sound = false,
	sounds = {
		-- shoot_attack = "mobs_fireball",
	},
	walk_velocity = 1,
	run_velocity = 3,
	jump = true,
	view_range = 30,
	drops = {
	},
	water_damage = 1,
	lava_damage = 1,
	light_damage = 0,
	fear_height = 3,
})

mobs:register_egg("drwho_mobs:dalek", S("Dalek"), "fire_basic_flame.png", 1)


mobs:alias_mob("drwho_mobs:dalek", "drwho_mobs:dalek") -- compatibility


-- fireball (weapon)
mobs:register_arrow("drwho_mobs:fireball", {
	visual = "sprite",
	visual_size = {x = 1, y = 1},
	textures = {"mobs_fireball.png"},
	collisionbox = {-0.1, -0.1, -0.1, 0.1, 0.1, 0.1},
	velocity = 7,
	tail = 1,
	tail_texture = "mobs_fireball.png",
	tail_size = 10,
	glow = 5,
	expire = 0.1,

	on_activate = function(self, staticdata, dtime_s)

		self.object:set_armor_groups({immortal = 1, fleshy = 100})
	end,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 8},
		}, nil)
	end,

	hit_node = function(self, pos, node)
		mobs:boom(self, pos, 1)
	end
})
