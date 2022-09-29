waste_materials = {}
waste_materials.modpath = minetest.get_modpath("waste_materials")

dofile(waste_materials.modpath .. "/register_waste.lua")
