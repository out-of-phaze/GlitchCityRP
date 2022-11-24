#define SPECIES_LILIM   "Lilim"
#define BODYTYPE_LILIM  "Lilim body"

/decl/modpack/lilim
	name = "Lilim Content"
	dreams = list("a DFC-72 model Lilim", "a King-Class CH1A model Lilim", "a DT-01 model Lilim")
	credits_crew_names = list("LILITH", "THE LILIM")
	credits_topics = list("THE COLLECTIVE SOURCE")

/mob/living/carbon/human/lilim/Initialize(mapload, new_species)
	. = ..(mapload, SPECIES_LILIM)
