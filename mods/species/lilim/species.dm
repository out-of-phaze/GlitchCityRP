/decl/species/lilim
	name = SPECIES_LILIM
	name_plural = "Lilim"
	base_prosthetics_model = null

	description = "The Lilim are synthetic, artificially intelligent humanoids created from the template of an AI named Lilith. \
	Most modern Lilim are part of a cloud backup system called the 'Collective Source'."
	hidden_from_codex = FALSE

	meat_type = null
	bone_material = null
	skin_material = null

	blood_types = list(/decl/blood_type/coolant)

	available_bodytypes = list(
		/decl/bodytype/lilim,
		/decl/bodytype/lilim/masculine
	)
	cyborg_noun =             null

	rarity_value =            6

	base_eye_color = COLOR_LIME

	speech_sounds = list('mods/species/bayliens/adherent/sound/chime.ogg')
	speech_chance = 25

	cold_level_1 = SYNTH_COLD_LEVEL_1
	cold_level_2 = SYNTH_COLD_LEVEL_2
	cold_level_3 = SYNTH_COLD_LEVEL_3

	heat_level_1 = SYNTH_HEAT_LEVEL_1
	heat_level_2 = SYNTH_HEAT_LEVEL_2
	heat_level_3 = SYNTH_HEAT_LEVEL_3

	species_flags = SPECIES_FLAG_NO_PAIN | SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_SYNTHETIC
	spawn_flags =   SPECIES_CAN_JOIN

	appearance_flags = HAS_EYE_COLOR
	flesh_color = "#ed90eb"

/*
	has_organ = list(
		BP_BRAIN =        /obj/item/organ/internal/brain/lilim,
		BP_EYES =         /obj/item/organ/internal/eyes/lilim,
		BP_CELL =         /obj/item/organ/internal/cell/lilim
		)
*/

/decl/species/lilim/apply_species_organ_modifications(var/obj/item/organ/org)
	..()
	org.robotize(/decl/prosthetics_manufacturer/lilim, FALSE, TRUE, check_species = SPECIES_LILIM)
