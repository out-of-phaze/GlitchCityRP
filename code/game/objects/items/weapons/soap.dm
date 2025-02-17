/obj/item/soap
	name = "soap"
	desc = "A cheap bar of soap. Doesn't smell."
	gender = PLURAL
	icon = 'icons/obj/items/soap.dmi'
	icon_state = "soap"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	w_class = ITEM_SIZE_SMALL
	throwforce = 0
	throw_speed = 4
	throw_range = 20
	material = /decl/material/liquid/cleaner
	health = 5
	max_health = 5
	var/key_data

	var/list/valid_colors = list(COLOR_GREEN_GRAY, COLOR_RED_GRAY, COLOR_BLUE_GRAY, COLOR_BROWN, COLOR_PALE_PINK, COLOR_PALE_BTL_GREEN, COLOR_OFF_WHITE, COLOR_GRAY40, COLOR_GOLD)
	var/list/valid_scents = list("fresh air", "cinnamon", "mint", "cocoa", "lavender", "an ocean breeze", "a summer garden", "vanilla", "cheap perfume")
	var/list/scent_intensity = list("faintly", "strongly", "overbearingly")
	var/list/valid_shapes = list("oval", "circular", "rectangular", "square")
	var/decal_name
	var/list/decals = list("diamond", "heart", "circle", "triangle", "")

/obj/item/soap/Initialize()
	. = ..()
	create_reagents(30)
	wet()
	var/shape = pick(valid_shapes)
	var/scent = pick(valid_scents)
	var/smelly = pick(scent_intensity)
	icon_state = "soap-[shape]"
	color = pick(valid_colors)
	decal_name = pick(decals)
	desc = "\A [shape] bar of soap. It smells [smelly] of [scent]."
	update_icon()

/obj/item/soap/proc/wet()
	reagents.add_reagent(/decl/material/liquid/cleaner, 15)

/obj/item/soap/Crossed(var/mob/living/AM)
	if(istype(AM))
		AM.slip("the [src.name]", 3)

/obj/item/soap/afterattack(atom/target, mob/user, proximity)
	if(!proximity) return
	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	var/cleaned = FALSE
	if(user.client && (target in user.client.screen))
		to_chat(user, "<span class='notice'>You need to take that [target.name] off before cleaning it.</span>")
	else if(istype(target,/obj/effect/decal/cleanable/blood))
		to_chat(user, "<span class='notice'>You scrub \the [target.name] out.</span>")
		target.clean_blood() //Blood is a cleanable decal, therefore needs to be accounted for before all cleanable decals.
		cleaned = TRUE
	else if(istype(target,/obj/effect/decal/cleanable))
		to_chat(user, "<span class='notice'>You scrub \the [target.name] out.</span>")
		qdel(target)
		cleaned = TRUE
	else if(isturf(target) || istype(target, /obj/structure/catwalk))
		var/turf/T = get_turf(target)
		if(!T)
			return
		user.visible_message(SPAN_NOTICE("\The [user] starts scrubbing \the [T]."))
		if(do_after(user, 8 SECONDS, T) && reagents?.total_volume)
			reagents.splash(T, FLUID_QDEL_POINT)
			to_chat(user, SPAN_NOTICE("You scrub \the [target] clean."))
			cleaned = TRUE

	else if(istype(target,/obj/structure/hygiene/sink))
		to_chat(user, "<span class='notice'>You wet \the [src] in the sink.</span>")
		wet()
	else if(ishuman(target))
		to_chat(user, "<span class='notice'>You clean \the [target.name].</span>")
		if(reagents)
			reagents.trans_to(target, reagents.total_volume / 8)
		target.clean_blood() //Clean bloodied atoms. Blood decals themselves need to be handled above.
		cleaned = TRUE
	else 
		to_chat(user, "<span class='notice'>You clean \the [target.name].</span>")
		target.clean_blood() //Clean bloodied atoms. Blood decals themselves need to be handled above.
		cleaned = TRUE

	if(cleaned)
		user.update_personal_goal(/datum/goal/clean, 1)

//attack_as_weapon
/obj/item/soap/attack(mob/living/target, mob/living/user, var/target_zone)
	if(target && user && ishuman(target) && ishuman(user) && !target.stat && !user.stat && user.zone_sel &&user.zone_sel.selecting == BP_MOUTH)
		user.visible_message("<span class='danger'>\The [user] washes \the [target]'s mouth out with soap!</span>")
		if(reagents)
			reagents.trans_to_mob(target, reagents.total_volume / 2, CHEM_INGEST)
		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN) //prevent spam
		return
	..()

/obj/item/soap/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/key))
		if(!key_data)
			to_chat(user, "<span class='notice'>You imprint \the [I] into \the [src].</span>")
			var/obj/item/key/K = I
			key_data = K.key_data
			update_icon()
		return
	..()

/obj/item/soap/on_update_icon()
	. = ..()
	if(key_data)
		add_overlay("soap_key_overlay")
	else if(decal_name)
		add_overlay("decal-[decal_name]")