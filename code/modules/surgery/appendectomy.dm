/datum/surgery/appendectomy
	name = "appendectomy"
	steps = list(/datum/surgery_step/incise, /datum/surgery_step/clamp_bleeders, /datum/surgery_step/retract_skin, /datum/surgery_step/incise, /datum/surgery_step/extract_appendix, /datum/surgery_step/close)
	species = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list("groin")


//extract appendix
/datum/surgery_step/extract_appendix
	name = "extract appendix"
	accept_hand = 1
	time = 64
	var/obj/item/organ/internal/appendix/A = null

/datum/surgery_step/extract_appendix/preop(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	A = locate() in target.internal_organs
	if(A)
		user.visible_message("[user] begins to extract [target]'s appendix.", "<span class='notice'>You begin to extract [target]'s appendix...</span>")
	else
		user.visible_message("[user] looks for an appendix in [target].", "<span class='notice'>You look for an appendix in [target]...</span>")

/datum/surgery_step/extract_appendix/success(mob/user, mob/living/carbon/target, target_zone, obj/item/tool, datum/surgery/surgery)
	if(A)
		user.visible_message("[user] successfully removes [target]'s appendix!", "<span class='notice'>You successfully removes [target]'s appendix.</span>")
		A.loc = get_turf(target)
		A.Remove(target)
	else
		user << "<span class='warning'>You can't find an appendix in [target]!</span>"
	return 1