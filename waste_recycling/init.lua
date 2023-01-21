waste_recycling = {}
waste_recycling.modpath = minetest.get_modpath("waste_recycling")

dofile(waste_recycling.modpath .. "/recycletable.lua")
dofile(waste_recycling.modpath .. "/sieve.lua")
dofile(waste_recycling.modpath .. "/register_recipes.lua")

--Conditional inits

---by mod presents
if minetest.get_modpath("awards") then
	dofile(waste_recycling.modpath .. "/awards.lua")
end

---by settings
if minetest.settings:get("enable_waste_recycling_machines") then
	dofile(waste_recycling.modpath .. "/register_crafting_items.lua")
	--dofile(waste_recycling.modpath .. "/xxx_register_machines.lua")
	--dofile(waste_recycling.modpath .. "/xxx_shaker.lua")
	dofile(waste_recycling.modpath .. "/register_machines.lua")
end
