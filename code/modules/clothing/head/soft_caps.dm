/obj/item/clothing/head/soft
	name = "cargo cap"
	initial_name = "yellow cap"
	desc = "It's a peaked cap in a tasteless yellow color."
	icon_state = "cargosoft"
	item_state_slots = list(
		slot_l_hand_str = "helmet", //probably a placeholder
		slot_r_hand_str = "helmet",
		)
	var/flipped = 0
	siemens_coefficient = 0.9
	body_parts_covered = 0

/obj/item/clothing/head/soft/dropped()
	src.icon_state = initial(icon_state)
	src.flipped=0
	..()

/obj/item/clothing/head/soft/attack_self(mob/user)
	src.flipped = !src.flipped
	if(src.flipped)
		icon_state = "[icon_state]_flipped"
		user << "You flip the hat backwards."
	else
		src.icon_state = initial(icon_state)
		user << "You flip the hat back in normal position."
	update_wear_icon()	//so our mob-overlays update

/obj/item/clothing/head/soft/red
	name = "red cap"
	initial_name = "red cap"
	desc = "It's a baseball hat in a tasteless red color."
	icon_state = "redsoft"

/obj/item/clothing/head/soft/blue
	name = "blue cap"
	initial_name = "blue cap"
	desc = "It's a peaked cap in a tasteless blue color."
	icon_state = "bluesoft"

/obj/item/clothing/head/soft/green
	name = "green cap"
	initial_name = "green cap"
	desc = "It's a peaked cap in a tasteless green color."
	icon_state = "greensoft"

/obj/item/clothing/head/soft/yellow
	name = "yellow cap"
	initial_name = "yellow cap"
	desc = "It's a peaked cap in a tasteless yellow color."
	icon_state = "yellowsoft"

/obj/item/clothing/head/soft/grey
	name = "grey cap"
	initial_name = "grey cap"
	desc = "It's a peaked cap in a tasteful grey color."
	icon_state = "greysoft"

/obj/item/clothing/head/soft/orange
	name = "orange cap"
	initial_name = "orange cap"
	desc = "It's a peaked cap in a tasteless orange color."
	icon_state = "orangesoft"

/obj/item/clothing/head/soft/mime
	name = "white cap"
	initial_name = "cap"
	desc = "It's a peaked cap in a tasteless white color."
	icon_state = "mimesoft"

/obj/item/clothing/head/soft/purple
	name = "purple cap"
	initial_name = "purple cap"
	desc = "It's a peaked cap in a tasteless purple color."
	icon_state = "purplesoft"

/obj/item/clothing/head/soft/rainbow
	name = "rainbow cap"
	initial_name = "rainbow cap"
	desc = "It's a peaked cap in a bright rainbow of colors."
	icon_state = "rainbowsoft"

/obj/item/clothing/head/soft/sec
	name = "security cap"
	initial_name = "security cap"
	desc = "It's a field cap in tasteful red color."
	icon_state = "secsoft"

/obj/item/clothing/head/soft/sec/corp
	name = "corporate security cap"
	initial_name = "corporate security cap"
	desc = "It's field cap in corporate colors."
	icon_state = "corpsoft"
