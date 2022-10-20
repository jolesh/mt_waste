minetest.clear_registered_biomes()

minetest.register_biome {
	name = "wasteland",
	node_top = "waste_materials:trashy_dirt_with_grass",
	depth_top = 1,
	node_filler = "waste_materials:trashy_dirt",
	depth_filler = 3,
	heat_point = 80,
	humidity_point = 30,
}

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"group:soil"},
    sidelen = 2,
	 biomes = {"wasteland"},
    fill_ratio = 0.002,
    y_max = 200,
    y_min = -20,
	 height_max = 5,
    decoration = "default:tree",
})
