/* Types of tanks!
 * Contains:
 *		Oxygen
 *		Anesthetic
 *		Air
 *		Plasma
 *		Emergency Oxygen
 */

/*
 * Oxygen
 */
/obj/item/weapon/tank/oxygen
	name = "oxygen tank"
	desc = "A tank of oxygen."
	icon_state = "oxygen"
	force = WEAPON_FORCE_PAINFUL
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD


	New()
		..()
		air_contents.adjust_gas("oxygen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))
		return


	examine(mob/user)
		if(..(user, 0) && air_contents.gas["oxygen"] < 10)
			user << text(SPAN_WARNING("The meter on \the [src] indicates you are almost out of oxygen!"))
			//playsound(usr, 'sound/effects/alert.ogg', 50, 1)


/obj/item/weapon/tank/oxygen/yellow
	desc = "A tank of oxygen, this one is yellow."
	icon_state = "oxygen_f"

/obj/item/weapon/tank/oxygen/red
	desc = "A tank of oxygen, this one is red."
	icon_state = "oxygen_fr"


/*
 * Anesthetic
 */
/obj/item/weapon/tank/anesthetic
	name = "anesthetic tank"
	desc = "A tank with an N2O/O2 gas mix."
	icon_state = "anesthetic"
	item_state = "an_tank"

/obj/item/weapon/tank/anesthetic/New()
	..()

	air_contents.gas["oxygen"] = (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C) * O2STANDARD
	air_contents.gas["sleeping_agent"] = (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C) * N2STANDARD
	air_contents.update_values()

	return

/*
 * Air
 */
/obj/item/weapon/tank/air
	name = "air tank"
	desc = "Mixed anyone?"
	icon_state = "oxygen"
	force = WEAPON_FORCE_PAINFUL


	examine(mob/user)
		if(..(user, 0) && air_contents.gas["oxygen"] < 1 && loc==user)
			user << SPAN_DANGER("The meter on the [src.name] indicates you are almost out of air!")
			user << sound('sound/effects/alert.ogg')

/obj/item/weapon/tank/air/New()
	..()

	src.air_contents.adjust_multi("oxygen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C) * O2STANDARD, "nitrogen", (6*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C) * N2STANDARD)

	return


/*
 * Plasma
 */
/obj/item/weapon/tank/plasma
	name = "plasma tank"
	desc = "Contains dangerous plasma. Do not inhale. Warning: extremely flammable."
	icon_state = "plasma"
	force = WEAPON_FORCE_NORMAL
	gauge_icon = null
	flags = CONDUCT
	slot_flags = null	//they have no straps!


/obj/item/weapon/tank/plasma/New()
	..()

	src.air_contents.adjust_gas("plasma", (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C))
	return

/*
 * Emergency Oxygen
 */
/obj/item/weapon/tank/emergency_oxygen
	name = "emergency oxygen tank"
	desc = "Used for emergencies. Contains very little oxygen, so try to conserve it until you actually need it."
	icon_state = "emergency"
	gauge_icon = "indicator-tank-small"
	gauge_cap = 4
	flags = CONDUCT
	slot_flags = SLOT_BELT
	w_class = ITEM_SIZE_SMALL
	force = WEAPON_FORCE_NORMAL
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD
	volume = 2 //Tiny. Real life equivalents only have 21 breaths of oxygen in them. They're EMERGENCY tanks anyway -errorage (dangercon 2011)


	New()
		..()
		src.air_contents.adjust_gas("oxygen", (3*ONE_ATMOSPHERE)*volume/(R_IDEAL_GAS_EQUATION*T20C))

		return


	examine(mob/user)
		if(..(user, 0) && air_contents.gas["oxygen"] < 0.2 && loc==user)
			user << text(SPAN_DANGER("The meter on the [src.name] indicates you are almost out of air!"))
			user << sound('sound/effects/alert.ogg')

/obj/item/weapon/tank/emergency_oxygen/engi
	name = "extended-capacity emergency oxygen tank"
	icon_state = "emergency_engi"
	volume = 6

/obj/item/weapon/tank/emergency_oxygen/double
	name = "double emergency oxygen tank"
	icon_state = "emergency_double"
	gauge_icon = "indicator-tank-double"
	volume = 10

/*
 * Nitrogen
 */
/obj/item/weapon/tank/nitrogen
	name = "nitrogen tank"
	desc = "A tank of nitrogen."
	force = WEAPON_FORCE_PAINFUL
	icon_state = "oxygen_fr"
	distribute_pressure = ONE_ATMOSPHERE*O2STANDARD


/obj/item/weapon/tank/nitrogen/New()
	..()

	src.air_contents.adjust_gas("nitrogen", (3*ONE_ATMOSPHERE)*70/(R_IDEAL_GAS_EQUATION*T20C))
	return

/obj/item/weapon/tank/nitrogen/examine(mob/user)
	if(..(user, 0) && air_contents.gas["nitrogen"] < 10)
		user << text(SPAN_DANGER("The meter on \the [src] indicates you are almost out of nitrogen!"))
		//playsound(user, 'sound/effects/alert.ogg', 50, 1)