/datum/advclass/squire/seniorsquirearms
	name = "Learned Squire"
	tutorial = "Trained and having learned from the realm's finest for melee in a particular field, \
	you still have quite a way to go before you're a proper knight. \
	But now you're someone that can be trusted to represent the realm in some capacity, with the corresponding privileges in equipment."
	outfit = /datum/outfit/job/roguetown/squire/esquirearms
	min_pq = 3
	// maximum_possible_slots = 1  //commented out since I think OV can be chill about this with our PVE-lean
	category_tags = list(CTAG_SQUIRE)
	traits_applied = list(TRAIT_MEDIUMARMOR)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_SPD = 1,
		STATKEY_PER = 1,
		STATKEY_CON = 1,
		STATKEY_INT = 1,
		STATKEY_WIL = 1
	)
	subclass_skills = list(
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/shields = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/hunting = SKILL_LEVEL_NOVICE,
	)


/datum/outfit/job/roguetown/squire/esquirearms/pre_equip(mob/living/carbon/human/H)
	. = ..()
	add_verb(H, /mob/proc/haltyell_exhausting)
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/chainlegs/
	neck = /obj/item/clothing/neck/roguetown/chaincoif/
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/storage/belt/rogue/pouch,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/rogueweapon/hammer/copper,
		/obj/item/armor_brush = 1,
		/obj/item/polishing_cream = 1
	)
	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Longsword","Steel Mace","Steel Axe","Spear", "Sword and Shield")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Longsword")
				beltr = /obj/item/rogueweapon/scabbard/sword
				r_hand = /obj/item/rogueweapon/sword/long
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
			if("Steel Mace")
				beltr = /obj/item/rogueweapon/mace/steel
				H.adjust_skillrank_up_to(/datum/skill/combat/maces, SKILL_LEVEL_EXPERT, TRUE)
			if("Steel Axe")
				beltr = /obj/item/rogueweapon/stoneaxe/woodcut/steel
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_EXPERT, TRUE)
			if("Spear")
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				r_hand = /obj/item/rogueweapon/spear // make steel spear replacement at some point, maybe?
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
			if("Sword and Shield")
				beltr = /obj/item/rogueweapon/scabbard/sword
				r_hand = /obj/item/rogueweapon/sword
				backl = /obj/item/rogueweapon/shield/heater
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)
	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_WORKING_CLASS, H)

/datum/advclass/squire/seniorskirmisher
	name = "Learned Skirmisher"
	tutorial = "Your ways of fighting may be unconventional, but through blood and well earned trials \
	you have made yourself into a proper skirmisher...in training. But one that a few soldiers of the keep may even consider \
	respectable in skills."
	outfit = /datum/outfit/job/roguetown/squire/seniorskirmisher
	min_pq = 3
	// maximum_possible_slots = 1  //commented out since I think OV can be chill about this with our PVE-lean
	category_tags = list(CTAG_SQUIRE)
	traits_applied = list(TRAIT_DODGEEXPERT)
	subclass_stats = list(
		STATKEY_SPD = 2,
		STATKEY_PER = 1,
		STATKEY_CON = 1,
		STATKEY_INT = 1,
		STATKEY_WIL = 1
	)
	subclass_skills = list(
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/slings = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/unarmed = SKILL_LEVEL_NOVICE,
		/datum/skill/combat/swords = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/hunting = SKILL_LEVEL_NOVICE,
	)
//choice between bow, crossbow, sling, or rapier
/datum/outfit/job/roguetown/squire/seniorskirmisher/pre_equip(mob/living/carbon/human/H)
	. = ..()
	add_verb(H, /mob/proc/haltyell_exhausting)
	armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	neck = /obj/item/clothing/neck/roguetown/chaincoif/
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel, // you get better steel dagger
		/obj/item/storage/belt/rogue/pouch,
		/obj/item/rogueweapon/scabbard/sheath,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/rogueweapon/hammer/copper,
		/obj/item/armor_brush = 1,
		/obj/item/polishing_cream = 1
		)
	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Bow","Crossbow","Sling","Rapier","Shortsword and Buckler")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Bow")
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
				beltr = /obj/item/quiver/arrows
				H.adjust_skillrank_up_to(/datum/skill/combat/bows, SKILL_LEVEL_EXPERT, TRUE)
			if("Crossbow")
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
				beltr = /obj/item/quiver/bolt/standard
				H.adjust_skillrank_up_to(/datum/skill/combat/crossbows, SKILL_LEVEL_EXPERT, TRUE)
			if("Sling")
				beltr = /obj/item/quiver/sling/iron
				r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/sling
				H.adjust_skillrank_up_to(/datum/skill/combat/slings, SKILL_LEVEL_EXPERT, TRUE)
			if("Rapier")
				beltr = /obj/item/rogueweapon/scabbard/sword
				r_hand = /obj/item/rogueweapon/sword/rapier
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
			if("Shortsword and Buckler")
				beltr = /obj/item/rogueweapon/scabbard/sword
				r_hand = /obj/item/rogueweapon/sword/short
				backl = /obj/item/rogueweapon/shield/buckler
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)

	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_WORKING_CLASS , H)
