/datum/advclass/knight/veteran_squire
	name = "Veteran Squire"
	tutorial = "While not a full knight yet, whether for lack of opportunity or a preference to continue learning, \
	calling you a simple squire would mean belitting the trials you have faced, even if they haven't earned you a title yet."
	outfit = /datum/outfit/job/roguetown/knight/vetsquire
	// min_pq = 7 tempted to give it higher PQ since taking this requires the understanding you're taking a debuff of a power class here.
	category_tags = list(CTAG_ROYALGUARD)
	//no good trainer, CAN get heavy armour if you pick a certain option
	subclass_stats = list(
		STATKEY_STR = 1, //eating general stat debuff
		STATKEY_INT = 1,
		STATKEY_CON = 2,
		STATKEY_WIL = 2,
		STATKEY_PER = 1
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/hunting = SKILL_LEVEL_APPRENTICE,
	)



/datum/outfit/job/roguetown/knight/vetsquire/pre_equip(mob/living/carbon/human/H)
	..()
	H.dna.species.soundpack_m = GLOB.voice_packs[/datum/voicepack/male/knight]
	add_verb(H, /mob/proc/haltyell)
	REMOVE_TRAIT(H, TRAIT_NOBLE, JOB_TRAIT) //ain't a noble yet
	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Longsword","Steel Mace","Battle Axe","Halberd", "Sword and Shield")
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
			if("Battle Axe")
				r_hand = /obj/item/rogueweapon/stoneaxe/battle
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, SKILL_LEVEL_EXPERT, TRUE)
			if("Halberd")
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				r_hand = /obj/item/rogueweapon/halberd // make steel spear replacement at some point, maybe?
				H.adjust_skillrank_up_to(/datum/skill/combat/polearms, SKILL_LEVEL_EXPERT, TRUE)
			if("Sword and Shield")
				beltr = /obj/item/rogueweapon/scabbard/sword
				r_hand = /obj/item/rogueweapon/sword
				backl = /obj/item/rogueweapon/shield/heater
				H.adjust_skillrank_up_to(/datum/skill/combat/swords, SKILL_LEVEL_EXPERT, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN, TRUE)

	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	pants = /obj/item/clothing/under/roguetown/chainlegs
	backl = /obj/item/rogueweapon/shield/tower/metal
	if(H.mind)
		//get your helm from the armoury, squire
		var/armors = list(
			"Half-Plate"		= /obj/item/clothing/suit/roguetown/armor/plate,
			"Fluted Half-Plate" = /obj/item/clothing/suit/roguetown/armor/plate/fluted,
			"Steel Cuirass"		= /obj/item/clothing/suit/roguetown/armor/plate/cuirass,
			"Fluted Cuirass"	= /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted,
		)
		var/armorchoice = input(H, "Choose your armor.", "TAKE UP ARMOR") as anything in armors
		armor = armors[armorchoice]
		if(armorchoice = "Half-Plate" || armorchoice = "Fluted Half-Plate")
			ADD_TRAIT(H, TRAIT_HEAVYARMOR, JOB_TRAIT)
		else
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, JOB_TRAIT)


	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel = 1, //regular, no fancy noble things
		/obj/item/rope/chain = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
	)
	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_LOWER_MIDDLE_CLASS, H)
	//no direct protege training + ain't that rich

/datum/advclass/knight/veteranirreg_squire
	name = "Veteran Skirmisher"
	tutorial = "Fully trained in some of the irregular arts, you're awaiting the opportunity to make knighthood and prove how useful \
	these unusual fields of battle may be for a knight."
	outfit = /datum/outfit/job/roguetown/knight/vetskirmisher
	// min_pq = 7 tempted to give it higher PQ since taking this requires the understanding you're taking a debuff of a power class here.
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT)
	category_tags = list(CTAG_ROYALGUARD)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_INT = 1,
		STATKEY_WIL = 2,
		STATKEY_SPD = 1,
		STATKEY_PER = 1,
		STATKEY_LCK = 1
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT, //Swords and knives class.
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN, //Whips can work as a light class weapon.
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN, //Bows fit a light/speedy class pretty well, gave them ranged options.
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE, //Should have Jman but wears medium/light so no
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/hunting = SKILL_LEVEL_APPRENTICE,
	)


/datum/outfit/job/roguetown/knight/irregularknight/pre_equip(mob/living/carbon/human/H)
	..()
	H.dna.species.soundpack_m = GLOB.voice_packs[/datum/voicepack/male/knight]
	add_verb(H, /mob/proc/haltyell)

	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Rapier + Longbow","Estoc + Recurve Bow","Stecher + Recurve Bow","Sabre + Buckler","Whip + Crossbow","Poleaxe + Sling")
		var/armor_options = list("Light Armor", "Medium Armor", "Medium Cuirass")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		var/armor_choice = input(H, "Choose your armor.", "TAKE UP ARMS") as anything in armor_options
		H.set_blindness(0)
		switch(weapon_choice)
			if("Rapier + Longbow")
				r_hand = /obj/item/rogueweapon/sword/rapier
				beltl = /obj/item/rogueweapon/scabbard/sword/noble
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
				beltr = /obj/item/quiver/arrows

			if("Estoc + Recurve Bow")
				r_hand = /obj/item/rogueweapon/estoc
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				beltr = /obj/item/quiver/arrows
				beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve

			if("Stecher + Recurve Bow")
				r_hand = /obj/item/rogueweapon/sword/long/ap
				backl = /obj/item/rogueweapon/scabbard/sword/noble
				beltr = /obj/item/quiver/arrows
				beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve

			if("Sabre + Buckler")
				beltl = /obj/item/rogueweapon/scabbard/sword/noble
				r_hand = /obj/item/rogueweapon/sword/sabre
				backl = /obj/item/rogueweapon/shield/buckler

			if("Whip + Crossbow")
				beltl = /obj/item/rogueweapon/whip
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
				beltr = /obj/item/quiver/bolt/standard

			if("Poleaxe + Sling")
				H.adjust_skillrank(/datum/skill/combat/slings, 4, TRUE)
				H.adjust_skillrank_up_to(/datum/skill/combat/axes, 4, TRUE)
				r_hand = /obj/item/rogueweapon/greataxe/steel/knight
				backl = /obj/item/rogueweapon/scabbard/gwstrap
				beltr = /obj/item/quiver/sling/iron
				beltl = /obj/item/gun/ballistic/revolver/grenadelauncher/sling

		switch(armor_choice)
			if("Light Armor")
				shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
				pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
				armor = /obj/item/clothing/suit/roguetown/armor/leather/heavy/coat
			if("Medium Armor")
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
				pants = /obj/item/clothing/under/roguetown/chainlegs
				armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light/retinue
			if("Medium Cuirass")
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
				pants = /obj/item/clothing/under/roguetown/chainlegs
				armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass/fluted

		var/helmets = list(
			"Pigface Bascinet"	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface,
			"Guard Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/guard,
			"Barred Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/sheriff,
			"Bucket Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket,
			"Sugarloaf Helmet"		= /obj/item/clothing/head/roguetown/helmet/heavy/bucket/crusader,
			"Knight's Armet"	= /obj/item/clothing/head/roguetown/helmet/heavy/knight,
			"Knight's Helmet"	= /obj/item/clothing/head/roguetown/helmet/heavy/knight/old,
			"Knight's Greatplumed Armet"		= /obj/item/clothing/head/roguetown/helmet/heavy/knight/greatplume,
			"Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored,
			"Snouted Visored Sallet"	= /obj/item/clothing/head/roguetown/helmet/sallet/visored/snouted,
			"Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet,
			"Snouted Armet"				= /obj/item/clothing/head/roguetown/helmet/heavy/knight/armet/snouted,
			"Hounskull Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/hounskull,
			"Klappvisier Bascinet" = /obj/item/clothing/head/roguetown/helmet/bascinet/etruscan,
			"Slitted Kettle" = /obj/item/clothing/head/roguetown/helmet/heavy/knight/skettle,
			"Visored Barbute" = /obj/item/clothing/head/roguetown/helmet/heavy/barbute/visor,
			"Great Barbute" = /obj/item/clothing/head/roguetown/helmet/heavy/barbute/great,
			"Snouted Burgonet" = /obj/item/clothing/head/roguetown/helmet/heavy/burgonet,
			"Volfskulle Bascinet"		= /obj/item/clothing/head/roguetown/helmet/heavy/volfplate,
			"Roundface Bascinet"	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/roundface,
			"Snouted Roundface Bascinet"	= /obj/item/clothing/head/roguetown/helmet/bascinet/pigface/roundface/snouted,
			"None"
		)

		var/helmchoice = input(H, "Choose your Helm.", "TAKE UP HELMS") as anything in helmets
		if(helmchoice != "None")
			head = helmets[helmchoice]
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rope/chain = 1,
		/obj/item/rogueweapon/scabbard/sheath/noble = 1
	)
	if(H.mind)
		SStreasury.grant_savings(ECONOMIC_UPPER_CLASS, H)
		H.mind.AddSpell(new /datum/action/cooldown/spell/takeprotege)

