/* Utility Closets
 * Contains:
 *		Emergency Closet
 *		Fire Closet
 *		Tool Closet
 *		Radiation Closet
 *		Bombsuit Closet
 *		Hydrant
 *		First Aid
 *		Excavation Closet
 *		Shipping Supplies Closet
 */

/*
 * Emergency Closet
 */
/obj/structure/closet/emcloset
	name = "emergency closet"
	desc = "It's a storage unit for emergency breathmasks and o2 tanks."
	closet_appearance = /decl/closet_appearance/oxygen

/obj/structure/closet/emcloset/WillContain()
	//Guaranteed kit - two tanks and masks
	. = list(/obj/item/tank/emergency/oxygen = 2,
			/obj/item/clothing/mask/breath = 2)

	. += new/datum/atom_creator/simple(list(/obj/item/storage/toolbox/emergency, /obj/item/inflatable = 2, /obj/item/inflatable/door = 1), 75)
	. += new/datum/atom_creator/simple(list(/obj/item/tank/emergency/oxygen/engi, /obj/item/clothing/mask/gas/half), 10)
	. += new/datum/atom_creator/simple(/obj/item/oxycandle, 15)
	. += new/datum/atom_creator/simple(/obj/item/storage/firstaid/o2, 25)
	. += new/datum/atom_creator/simple(list(/obj/item/clothing/suit/space/emergency,/obj/item/clothing/head/helmet/space/emergency), 25)

/*
 * Fire Closet
 */
/obj/structure/closet/firecloset
	name = "fire-safety closet"
	desc = "It's a storage unit for fire-fighting supplies."
	closet_appearance = /decl/closet_appearance/oxygen/fire


/obj/structure/closet/firecloset/WillContain()
	return list(
		/obj/item/storage/med_pouch/burn,
		/obj/item/storage/backpack/dufflebag/firefighter,
		/obj/item/clothing/mask/gas,
		/obj/item/flashlight
		)

/obj/structure/closet/firecloset/chief

/obj/structure/closet/firecloset/chief/WillContain()
	return list(
		/obj/item/storage/med_pouch/burn,
		/obj/item/clothing/suit/fire,
		/obj/item/clothing/mask/gas,
		/obj/item/flashlight,
		/obj/item/tank/emergency/oxygen/double/red,
		/obj/item/extinguisher,
		/obj/item/clothing/head/hardhat/firefighter)

/*
 * Tool Closet
 */
/obj/structure/closet/toolcloset
	name = "tool closet"
	desc = "It's a storage unit for tools."
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/tools

/obj/structure/closet/toolcloset/Initialize()
	. = ..()
	if(prob(40))
		new /obj/item/clothing/suit/storage/hazardvest(src)
	if(prob(70))
		new /obj/item/flashlight(src)
	if(prob(70))
		new /obj/item/screwdriver(src)
	if(prob(70))
		new /obj/item/wrench(src)
	if(prob(70))
		new /obj/item/weldingtool(src)
	if(prob(70))
		new /obj/item/crowbar(src)
	if(prob(70))
		new /obj/item/wirecutters(src)
	if(prob(70))
		new /obj/item/t_scanner(src)
	if(prob(20))
		new /obj/item/storage/belt/utility(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(30))
		new /obj/item/stack/cable_coil/random(src)
	if(prob(20))
		new /obj/item/multitool(src)
	if(prob(5))
		new /obj/item/clothing/gloves/insulated(src)
	if(prob(40))
		new /obj/item/clothing/head/hardhat(src)


/*
 * Radiation Closet
 */
/obj/structure/closet/radiation
	name = "radiation suit closet"
	desc = "It's a storage unit for rad-protective suits."
	closet_appearance = /decl/closet_appearance/secure_closet/engineering/tools/radiation

/obj/structure/closet/radiation/WillContain()
	return list(
		/obj/item/storage/med_pouch/radiation = 2,
		/obj/item/clothing/suit/radiation,
		/obj/item/clothing/head/radiation,
		/obj/item/clothing/suit/radiation,
		/obj/item/clothing/head/radiation,
		/obj/item/geiger = 2)

/*
 * Bombsuit closet
 */
/obj/structure/closet/bombcloset
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	closet_appearance = /decl/closet_appearance/bomb

/obj/structure/closet/bombcloset/WillContain()
	return list(
		/obj/item/clothing/suit/bomb_suit,
		/obj/item/clothing/under/color/black,
		/obj/item/clothing/shoes/color/black,
		/obj/item/clothing/head/bomb_hood)


/obj/structure/closet/bombclosetsecurity
	name = "\improper EOD closet"
	desc = "It's a storage unit for explosion-protective suits."
	closet_appearance = /decl/closet_appearance/bomb/security

/obj/structure/closet/bombclosetsecurity/WillContain()
	return list(
		/obj/item/clothing/suit/bomb_suit/security,
		/obj/item/clothing/under/security,
		/obj/item/clothing/shoes/color/brown,
		/obj/item/clothing/head/bomb_hood/security)

/*
 * Hydrant
 */
/obj/structure/closet/hydrant //wall mounted fire closet
	name = "fire-safety wall closet"
	desc = "It's a storage unit for fire-fighting supplies."
	closet_appearance = /decl/closet_appearance/wall/hydrant
	anchored = 1
	density = 0
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS
	setup = 0
	obj_flags = OBJ_FLAG_MOVES_UNSUPPORTED
	directional_offset = "{'NORTH':{'y':-32}, 'SOUTH':{'y':32}, 'EAST':{'x':-32}, 'WEST':{'x':32}}"
	
/obj/structure/closet/hydrant/Initialize()
	. = ..()
	tool_interaction_flags &= ~TOOL_INTERACTION_ANCHOR

/obj/structure/closet/hydrant/WillContain()
	return list(
		/obj/item/inflatable = 2,
		/obj/item/inflatable/door = 2,
		/obj/item/storage/med_pouch/burn = 2,
		/obj/item/clothing/mask/gas/half,
		/obj/item/storage/backpack/dufflebag/firefighter
		)

/*
 * First Aid
 */
/obj/structure/closet/medical_wall //wall mounted medical closet
	name = "first-aid wall closet"
	desc = "It's a wall-mounted storage unit for first aid supplies."
	closet_appearance = /decl/closet_appearance/wall/medical
	anchored = 1
	density = 0
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS
	setup = 0
	obj_flags = OBJ_FLAG_MOVES_UNSUPPORTED
	directional_offset = "{'NORTH':{'y':-32}, 'SOUTH':{'y':32}, 'EAST':{'x':-32}, 'WEST':{'x':32}}"

/obj/structure/closet/medical_wall/Initialize()
	. = ..()
	tool_interaction_flags &= ~TOOL_INTERACTION_ANCHOR

/obj/structure/closet/medical_wall/filled/WillContain()
	return list(
		/obj/random/firstaid,
		/obj/random/medical/lite = 12)

/obj/structure/closet/shipping_wall
	name = "shipping supplies wall closet"
	desc = "It's a wall-mounted storage unit containing supplies for preparing shipments."
	closet_appearance = /decl/closet_appearance/wall/shipping
	anchored = 1
	density = 0
	wall_mounted = 1
	storage_types = CLOSET_STORAGE_ITEMS
	setup = 0
	obj_flags = OBJ_FLAG_MOVES_UNSUPPORTED
	directional_offset = "{'NORTH':{'y':-32}, 'SOUTH':{'y':32}, 'EAST':{'x':-32}, 'WEST':{'x':32}}"

/obj/structure/closet/shipping_wall/Initialize()
	. = ..()
	tool_interaction_flags &= ~TOOL_INTERACTION_ANCHOR

/obj/structure/closet/shipping_wall/filled/WillContain()
	return list(
		/obj/item/stack/material/cardstock/mapped/cardboard/ten,
		/obj/item/destTagger,
		/obj/item/stack/package_wrap/twenty_five
	)
