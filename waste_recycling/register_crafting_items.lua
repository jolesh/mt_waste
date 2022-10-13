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
