//White Knight armor
/obj/item/clothing/head/helmet/whiteknight
	name = "white knight helmet"
	desc = "An advanced helmet designed for work in special operations. Property of Zaibatsu Corporation."
	icon = 'mods/content/zaibatsu/icons/whiteknight/helmet.dmi'
	item_flags = ITEM_FLAG_THICKMATERIAL
	bodytype_equip_flags = BODY_FLAG_HUMANOID
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|BLOCK_ALL_HAIR
	body_parts_covered = SLOT_HEAD|SLOT_FACE|SLOT_EYES
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED
		)
	siemens_coefficient = 0.8
	center_of_mass = null
	randpixel = 0

/obj/item/clothing/suit/whiteknight
	name = "white knight armor"
	desc = "An advanced suit that protects against injuries during special operations. Property of Zaibatsu Corporation."
	icon = 'mods/content/zaibatsu/icons/whiteknight/suit.dmi'
	w_class = ITEM_SIZE_HUGE //bulky item
	item_flags = ITEM_FLAG_THICKMATERIAL
	bodytype_equip_flags = BODY_FLAG_HUMANOID
	body_parts_covered = SLOT_UPPER_BODY|SLOT_LOWER_BODY|SLOT_LEGS|SLOT_FEET|SLOT_ARMS|SLOT_HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	armor = list(
		melee = ARMOR_MELEE_RESISTANT,
		bullet = ARMOR_BALLISTIC_RESISTANT,
		laser = ARMOR_LASER_MAJOR,
		energy = ARMOR_ENERGY_MINOR,
		bomb = ARMOR_BOMB_PADDED
		)
	allowed = list(/obj/item/flashlight,/obj/item/tank,/obj/item/suit_cooling_unit,/obj/item/gun,/obj/item/ammo_magazine,/obj/item/ammo_casing,/obj/item/baton,/obj/item/energy_blade/sword,/obj/item/handcuffs)
	siemens_coefficient = 0.8
	center_of_mass = null
	randpixel = 0
	origin_tech = "{'materials':3, 'engineering':3}"
	material = /decl/material/solid/plastic
	matter = list(
		/decl/material/solid/metal/steel = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/metal/aluminium = MATTER_AMOUNT_REINFORCEMENT,
		/decl/material/solid/plastic = MATTER_AMOUNT_REINFORCEMENT
	)
	protects_against_weather = TRUE