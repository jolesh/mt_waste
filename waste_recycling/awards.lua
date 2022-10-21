local S = minetest.get_translator(minetest.get_current_modname())

awards.register_award("waste_recycling:award_cleanup",{
	title = S("Waste Cleanup"),
	description = S("Dig your first waste node"),
	icon = "waste_recycling_award_cleanup.png",
	difficulty = 0.03,

	on_unlock = function(name, def)
		minetest.chat_send_player(name, "Oh, look how much waste there is. Collect some more and build a Recycle Table to sort the waste.")
	end,

	trigger = {
		type = "dig",
		node = "group:waste_node",
		target = 1
	}
})

awards.register_award("waste_recycling:award_recycle_table",{
	title = S("Recycle Table"),
	description = S("Build a Recycle Table"),
	icon = "waste_recycling_award_recycle_table.png",
	difficulty = 0.05,

	on_unlock = function(name, def)
		minetest.chat_send_player(name, "Good work! Now rightclick with some waste node to place it on the Recycle Table. Then rightclick several times to sort it. Afterwards you can smelt metal waste objects and take other waste objects apart by crafting.")
	end,

	trigger = {
		type = "place",
		node = "waste_recycling:recycle_table",
		target = 1
	}
})

awards.register_award("waste_recycling:award_trashy_dirt",{
	title = S("Trashy Dirt"),
	description = S("Dig some trashy dirt up"),
	icon = "waste_recycling_award_trashy_dirt.png",
	difficulty = 0.03,

	on_unlock = function(name, def)
		minetest.chat_send_player(name, "Oh, look how much trashy dirt there is around here. Collect some more and build a Sieve to sort out the waste and clean the dirt up.")
	end,

	trigger = {
		type = "dig",
		node = "group:trashy_dirt",
		target = 1
	}
})

awards.register_award("waste_recycling:award_sieve",{
	title = S("Sieve"),
	description = S("Build a Sieve"),
	icon = "waste_recycling_award_sieve.png",
	difficulty = 0.05,

	on_unlock = function(name, def)
		minetest.chat_send_player(name, "Good work! Now rightclick with some waste node to place it in the Sieve. Then rightclick several times to sieve it. Afterwards you can smelt metal waste objects and take other waste objects apart by crafting.")
	end,

	trigger = {
		type = "place",
		node = "waste_recycling:sieve_empty",
		target = 1
	}
})

awards.register_award("waste_recycling:award_diamond_recycler",{
	title = S("Diamond Recycler"),
	description = S("Recycle a Diamond Shard"),
	icon = "waste_recycling_award_diamond_recycler.png",
	difficulty = 0.07,

	on_unlock = function(name, def)
		minetest.chat_send_player(name, "Nice! Now you know the basics of manuel waste recycling. You can craft a hammermill as first step of automatisation.")
	end,

	trigger = {
		type = "craft",
		node = "nuggets:diamond_shard",
		target = 1
	}
})

awards.register_award("waste_recycling:award_raccoon",{
	title = S("Raccoon"),
	description = S("Eat Food found in waste"),
	icon = "waste_recycling_award_raccoon.png",
	difficulty = 0.06,

	on_unlock = function(name, def)
	--	minetest.chat_send_player(name, "Yummy! But maybe it would be a good idea to get a healthier food source.")
	end,

	trigger = {
		type = "eat",
		node = "waste_materials:waste_food_can",
		target = 1
	}
})
