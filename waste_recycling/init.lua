waste_recycling = {}
waste_recycling.modpath = minetest.get_modpath("waste_recycling")

dofile(waste_recycling.modpath .. "/recycletable.lua")
dofile(waste_recycling.modpath .. "/sieve.lua")
--dofile(waste_recycling.modpath .. "/register_items.lua")
dofile(waste_recycling.modpath .. "/register_machines.lua")
dofile(waste_recycling.modpath .. "/register_crafting_items.lua")
dofile(waste_recycling.modpath .. "/register_recipes.lua")
