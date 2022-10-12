local S = minetest.get_translator(minetest.get_current_modname())

--Nodes

minetest.register_node("waste_recycling:case_t1", {
   description = S("T1 Casing"),
   tiles = {"waste_recycling_case_t1.png"},
   groups = {oddly_breakable_by_hand = 2, waste = 1},
})

--Items
--[[
minetest.register_craftitem("waste_recycling:magnet", {
   description = S("Magnet"),
   inventory_image = "waste_recycling_magnet.png", --missing
})]]

--Metal Nuggets

if minetest.get_modpath("simple_recycle") then
	return
else
	minetest.register_craftitem(":simple_recycle:steel_nugget", {
	   description = S("Steel Nugget"),
	   inventory_image = "simple_recycle_steel_nugget.png"
	})

	minetest.register_craftitem(":simple_recycle:bronze_nugget", {
	   description = S("Bronze Nugget"),
	   inventory_image = "simple_recycle_bronze_nugget.png"
	})

	minetest.register_craftitem(":simple_recycle:gold_nugget", {
	   description = S("Gold Nugget"),
	   inventory_image = "simple_recycle_gold_nugget.png"
	})

	minetest.register_craftitem(":simple_recycle:tin_nugget", {
	   description = S("Tin Nugget"),
	   inventory_image = "simple_recycle_tin_nugget.png"
	})

	minetest.register_craftitem(":simple_recycle:copper_nugget", {
	   description = S("Copper Nugget"),
	   inventory_image = "simple_recycle_copper_nugget.png"
	})
end
