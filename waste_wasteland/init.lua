waste_wasteland = {}
waste_wasteland.modpath = minetest.get_modpath("waste_wasteland")

if minetest.settings:get("enable_wasteland") then
dofile(waste_wasteland.modpath .. "/wasteland_biom.lua")
end
