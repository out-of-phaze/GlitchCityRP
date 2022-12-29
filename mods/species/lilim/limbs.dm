/decl/prosthetics_manufacturer/lilim
	name = "Lilim"
	desc = "This body part is designed for a Lilim, with synthetic skin and articulated joints."
	icon = null // overridden by get_base_icon
	can_eat = TRUE
	skintone = FALSE
	species_restricted = list(SPECIES_LILIM)
	limb_blend = ICON_MULTIPLY
	modular_prosthetic_tier = MODULAR_BODYPART_CYBERNETIC
	modifier_string = "synthetic"

// Readd when we want lilim part manufacturing.
/*
DEFINE_ROBOLIMB_DESIGNS(/decl/prosthetics_manufacturer/lilim, lilim)
/datum/fabricator_recipe/robotics/prosthetic/model_lilim/chest
	path = /obj/item/organ/external/chest
*/

/decl/prosthetics_manufacturer/lilim/get_base_icon(var/mob/living/carbon/human/owner)
	if(!istype(owner) || !istype(owner.bodytype, /decl/bodytype/lilim))
		return ..()
	return owner.bodytype.icon_base