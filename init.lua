
local path = minetest.get_modpath("drwho_mobs")

-- Intllib
local S
if minetest.get_modpath("intllib") then
	S = intllib.Getter()
else
	S = function(s, a, ...)
		if a == nil then
			return s
		end
		a = {a, ...}
		return s:gsub("(@?)@(%(?)(%d+)(%)?)",
			function(e, o, n, c)
				if e == ""then
					return a[tonumber(n)] .. (o == "" and c or "")
				else
					return "@" .. o .. n .. c
				end
			end)
	end
end
mobs.intllib = S

dofile(path .. "/tools/sonic.lua")

dofile(path .. "/mobs/cyberman.lua")
dofile(path .. "/mobs/dalek.lua")
-- dofile(path .. "mobs/angel.lua")

print (S("[MOD] Doctor Who Mobs loaded"))
