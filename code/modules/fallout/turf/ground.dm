//Fallout 13 general indestructible floor directory

/turf
	var/baseturf_icon
	var/baseturf_dir = 0

/turf/open/indestructible/ground
	icon = 'icons/fallout/turfs/ground.dmi'
	name = "\proper ground"
	icon_state = "wasteland1"
	intact = 0
	planetary_atmos = TRUE
	tiled_dirt = FALSE

	var/flags = NONE
	var/obj/structure/flora/turfPlant = null

/turf/open/indestructible/ground/New()
	..()
	baseturfs = src.type
	baseturf_icon = icon_state
	baseturf_dir = dir

/turf/open/indestructible/ground/attack_paw(mob/user)
	return src.attack_hand(user)

/turf/open/indestructible/ground/attackby(obj/item/C, mob/user, params)
	if(istype(C,/obj/item/stack/tile/plasteel))
		var/obj/item/stack/tile/plasteel/S = C
		if(S.use(1))
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			to_chat(user, "<span class='notice'>You build a floor.</span>")
			ChangeTurf(/turf/open/floor/plating)
		else
			to_chat(user, "<span class='warning'>You need one floor tile to build a floor!</span>")
	else
		return ..()
/*
/turf/ground/Entered(go/A)
	..()

/turf/open/indestructible/ground/handle_slip()
	return
*/
/turf/open/indestructible/ground/singularity_act()
	return

/turf/open/indestructible/ground/can_have_cabling()
	return TRUE

//////////////////////////////////////////////////////////////////////

/turf/open/indestructible/ground/outside
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/indestructible/ground/outside/Initialize()
	. = ..()
	flags_2 |= GLOBAL_LIGHT_TURF_2

#define GRASS_SPONTANEOUS_GROUND 		2
#define GRASS_WEIGHT_GROUND			4
#define LUSH_PLANT_SPAWN_LIST_GROUND list(/obj/structure/flora/grass/wasteland = 10, /obj/structure/flora/wasteplant/wild_broc = 7, /obj/structure/flora/wasteplant/wild_mesquite = 4, /obj/structure/flora/wasteplant/wild_feracactus = 5, /obj/structure/flora/wasteplant/wild_punga = 5, /obj/structure/flora/wasteplant/wild_coyote = 5, /obj/structure/flora/wasteplant/wild_tato = 5, /obj/structure/flora/wasteplant/wild_yucca = 5, /obj/structure/flora/wasteplant/wild_mutfruit = 5, /obj/structure/flora/wasteplant/wild_prickly = 5, /obj/structure/flora/wasteplant/wild_datura = 5, /obj/structure/flora/wasteplant/wild_buffalogourd = 5, /obj/structure/flora/wasteplant/wild_pinyon = 3, /obj/structure/flora/wasteplant/wild_xander = 5, /obj/structure/flora/wasteplant/wild_agave = 5, /obj/structure/flora/tree/joshua = 3, /obj/structure/flora/tree/cactus = 2, /obj/structure/flora/tree/wasteland = 2)
#define DESOLATE_PLANT_SPAWN_LIST_GROUND list(/obj/structure/flora/grass/wasteland = 1)

/turf/open/indestructible/ground/outside/dirthole
	name = "Dirt hole"
	icon_state = "dirthole"
	desc = "A dirt hole."
	slowdown = 3
	flags_1 = ADJACENCIES_OVERLAY

/turf/open/indestructible/ground/outside/river
	name = "river"
	icon_state = "riverwateruhh"
	desc = "A river."
	slowdown = 3
	flags_1 = ADJACENCIES_OVERLAY

/turf/open/indestructible/ground/outside/mountain
	name = "rocky floor"
	icon_state = "rockfloor1"
	icon = 'icons/fallout/turfs/mining.dmi'

//////////////
// SAVANNAH //
//////////////

/turf/open/indestructible/ground/outside/savannah
	name = "savannah"
	desc = "Some savannah."
	icon = 'icons/fallout/turfs/savannah.dmi'
	icon_state = "savannahcenter"
	slowdown = 0.4
	flags_1 = CAN_HAVE_NATURE | ADJACENCIES_OVERLAY
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

/turf/open/indestructible/ground/outside/savannah/center
	icon_state = "savannahcenter"
/turf/open/indestructible/ground/outside/savannah/bottomright
	icon_state = "savannah1"
/turf/open/indestructible/ground/outside/savannah/bottomcenter
	icon_state = "savannah2"
/turf/open/indestructible/ground/outside/savannah/bottomleft
	icon_state = "savannah3"
/turf/open/indestructible/ground/outside/savannah/leftcenter
	icon_state = "savannah4"
/turf/open/indestructible/ground/outside/savannah/topleft
	icon_state = "savannah5"
/turf/open/indestructible/ground/outside/savannah/topcenter
	icon_state = "savannah6"
/turf/open/indestructible/ground/outside/savannah/topright
	icon_state = "savannah7"
/turf/open/indestructible/ground/outside/savannah/rightcenter
	icon_state = "savannah8"
/turf/open/indestructible/ground/outside/savannah/bottomleftcorner
	icon_state = "savannah9"
/turf/open/indestructible/ground/outside/savannah/bottomrightcorner
	icon_state = "savannah10"
/turf/open/indestructible/ground/outside/savannah/topleftcorner
	icon_state = "savannah11"
/turf/open/indestructible/ground/outside/savannah/toprightcorner
	icon_state = "savannah12"
/turf/open/indestructible/ground/outside/savannah/cornersnew
	icon_state = "savannah13"
/turf/open/indestructible/ground/outside/savannah/edgesnew
	icon_state = "savannah14"

// Savannah merged with dark dirt 1-
/turf/open/indestructible/ground/outside/savannah/dark
	icon_state = "savannah1_dark"


// Salt Flats

/turf/open/indestructible/ground/outside/saltflats
	name = "salt flats"
	desc = "Flat salt."
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow"
//	step_sounds = list("human" = "dirtfootsteps")
	slowdown = 0.4
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_GRAVEL
	var/dug = FALSE				//FALSE = has not yet been dug, TRUE = has already been dug
	var/pit_sand = 1
	var/storedindex = 0			//amount of stored items
	var/mob/living/gravebody	//is there a body in the pit?
	var/obj/structure/closet/crate/coffin/gravecoffin //or maybe a coffin?
	var/obj/salvage //or salvage
	var/pitcontents = list()
	var/obj/dugpit/mypit
	var/unburylevel = 0
	var/list/loots = list(
						/obj/item/stack/crafting/metalparts/five = 30,
						/obj/item/stack/crafting/goodparts/five = 30,
						/obj/item/stack/ore/blackpowder/twenty = 10,
						/obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/mid = 3,
						/obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/low = 3
						)


/turf/open/indestructible/ground/outside/saltflats/gravleft
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "flatzsiding"
	dir = 8

/turf/open/indestructible/ground/outside/saltflats/gravright
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "flatzsiding"
	dir = 4

/turf/open/indestructible/ground/outside/saltflats/gravtop
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "flatzsiding"
	dir = 1

/turf/open/indestructible/ground/outside/saltflats/gravbottom
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "flatzsiding"
	dir = 2

/turf/open/indestructible/ground/outside/saltflats/old
	icon = 'icons/fallout/turfs/f13flatz.dmi'
	icon_state = "flatz"
	dir = 2

/turf/open/indestructible/ground/outside/saltflats/crackedcenter
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltgrains"
	dir = 2

/turf/open/indestructible/ground/outside/saltflats/crackedcenteralt
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltgrains2"
	dir = 2

/turf/open/indestructible/ground/outside/saltflats/crackedtop
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltsidesmirrored"
	dir = 5

/turf/open/indestructible/ground/outside/saltflats/crackedtop
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltsidesmirrored"
	dir = 2

/turf/open/indestructible/ground/outside/saltflats/crackedbot
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltsidesmirrored"
	dir = 1

/turf/open/indestructible/ground/outside/saltflats/crackedright
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltsidesmirrored"
	dir = 4

/turf/open/indestructible/ground/outside/saltflats/crackedleft
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltsidesmirrored"
	dir = 8

/turf/open/indestructible/ground/outside/saltflats/bluecenter
	icon = 'icons/turf/snow.dmi'
	icon_state = "saltstreaks"
	dir = 2

/turf/open/indestructible/ground/outside/saltflats/pathhor
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond1"
	dir = 4
	slowdown = 0

/turf/open/indestructible/ground/outside/saltflats/pathver
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond1"
	dir = 1
	slowdown = 0

/turf/open/indestructible/ground/outside/saltflats/evaporationpond
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond1"
	dir = 9

/turf/open/indestructible/ground/outside/saltflats/evaporationpondleft 
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond3"
	dir = 8

/turf/open/indestructible/ground/outside/saltflats/evaporationpondright
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond3"
	dir = 4

/turf/open/indestructible/ground/outside/saltflats/evaporationpondtop
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond3"
	dir = 1

/turf/open/indestructible/ground/outside/saltflats/evaporationpondbottom
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "evaporationpond3"
	dir = 2

// DESERT

/turf/open/indestructible/ground/outside/desert
	name = "desert"
	icon_state = "wasteland"
//	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/feracactus, /obj/item/seeds/corn,/obj/item/seeds/shroom, /obj/item/seeds/agave)
	slowdown = 0.4
	flags_1 = CAN_HAVE_NATURE | ADJACENCIES_OVERLAY
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	var/dug = FALSE				//FALSE = has not yet been dug, TRUE = has already been dug
	var/pit_sand = 1
	var/storedindex = 0			//amount of stored items
	var/mob/living/gravebody	//is there a body in the pit?
	var/obj/structure/closet/crate/coffin/gravecoffin //or maybe a coffin?
	var/obj/salvage //or salvage
	var/pitcontents = list()
	var/obj/dugpit/mypit
	var/unburylevel = 0
	var/list/loots = list(
						/obj/item/stack/crafting/metalparts/five = 30,
						/obj/item/stack/crafting/goodparts/five = 30,
						/obj/item/stack/ore/blackpowder/twenty = 10,
						/obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/mid = 3,
						/obj/effect/spawner/lootdrop/f13/weapon/gun/ballistic/low = 3
						)

//For sculpting with more precision, the random picking does not work very well. Slowdown 0.5 instead of 1. No random armor or gunpowder or titanium. Use directions for control. - Pebbles
/turf/open/indestructible/ground/outside/desert/sonora
	icon = 'icons/fallout/turfs/wasteland.dmi'
	icon_state = "desertsmooth"
	slowdown = 0.3
	list/loots = list(
						/obj/item/stack/crafting/metalparts/five = 30,
						)
	footstep = FOOTSTEP_LOOSE_SAND
	barefootstep = FOOTSTEP_LOOSE_SAND
	clawfootstep = FOOTSTEP_LOOSE_SAND

/turf/open/indestructible/ground/outside/desert/sonora/coarse
	icon_state = "desertcoarse"
	slowdown = 0.6

/turf/open/indestructible/ground/outside/desert/sonora/coarse2
	icon_state = "desertcoarse2"
	slowdown = 0.6

/turf/open/indestructible/ground/outside/desert/sonora/rough
	icon_state = "desertrough"
	slowdown = 0.4

/turf/open/indestructible/ground/outside/desert/Initialize()
	. = ..()
	if(prob(2))
		var/obj/derp = pickweight(loots)
		salvage = new derp()
	if(!((locate(/obj/structure) in src) || (locate(/obj/machinery) in src)))
		plantGrass()
	if(icon_state == "wasteland")
		icon_state = "wasteland[rand(1,61)]"
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(istype(turf_to_check, /turf/open/water))
			var/obj/effect/overlay/desert_side/DS = new /obj/effect/overlay/desert_side(src)
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = dir = turn(direction, 180)

/obj/effect/overlay/desert_side
	name = "desert"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "wasteland_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

// Two edge smootheners for the new desert turf
/obj/effect/overlay/desert/sonora/edge
	name = "desert edge"
	icon = 'icons/fallout/turfs/wasteland.dmi'
	icon_state = "desertedge"
	plane = FLOOR_PLANE
	layer = LOW_OBJ_LAYER

/obj/effect/overlay/desert/sonora/edge/corner
	icon_state = "desertcorner"

/obj/effect/overlay/desert/sonora/edge/north
	name = "desert edge"
	dir = NORTH

/obj/effect/overlay/desert/sonora/edge/south
	name = "desert edge"
	dir = SOUTH

/obj/effect/overlay/desert/sonora/edge/east
	name = "desert edge"
	dir = EAST

/obj/effect/overlay/desert/sonora/edge/west
	name = "desert edge"
	dir = WEST

/obj/effect/overlay/desert/sonora/saltflats
	name = "salt flats"
	icon = 'icons/fallout/turfs/f13flatz.dmi'
	icon_state = "edgebright"
	plane = FLOOR_PLANE
	layer = LOW_OBJ_LAYER

/obj/effect/overlay/desert/sonora/saltflats/north
	name = "salt flats"
	dir = NORTH

/obj/effect/overlay/desert/sonora/saltflats/south
	name = "salt flats"
	dir = SOUTH

/obj/effect/overlay/desert/sonora/saltflats/east
	name = "salt flats"
	dir = EAST

/obj/effect/overlay/desert/sonora/saltflats/west
	name = "salt flats"
	dir = WEST

/turf/open/indestructible/ground/outside/desert/proc/plantGrass(Plantforce = FALSE)
	var/Weight = 0
	var/randPlant = null

	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS_GROUND))
		randPlant = pickweight(LUSH_PLANT_SPAWN_LIST_GROUND) //Create a new grass object at this location, and assign var
		turfPlant = new randPlant(src)
		. = TRUE //in case we ever need this to return if we spawned
		return .

	//loop through neighbouring desert turfs, if they have grass, then increase weight
	for(var/turf/open/indestructible/ground/outside/desert/T in RANGE_TURFS(3, src))
		if(T.turfPlant)
			Weight += GRASS_WEIGHT

	//use weight to try to spawn grass
	if(prob(Weight))

		//If surrounded on 5+ sides, pick from lush
		if(Weight == (5 * GRASS_WEIGHT))
			randPlant = pickweight(LUSH_PLANT_SPAWN_LIST_GROUND)
		else
			randPlant = pickweight(DESOLATE_PLANT_SPAWN_LIST_GROUND)
		turfPlant = new randPlant(src)
		. = TRUE

/turf/open/indestructible/ground/outside/desert/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return //I mean, it makes sense that deserts don't get slippery, I guess... :(

//Make sure we delete the plant if we ever change turfs
/turf/open/indestructible/ground/outside/desert/ChangeTurf(path, list/new_baseturfs, flags)
	if(turfPlant)
		qdel(turfPlant)
	return ..()

/turf/open/indestructible/ground/outside/desert/lifeless // eventually replace the resprited gravel under objects and structures with a desert type that doesn't spawn plants to save loading time
	flags_1 = ADJACENCIES_OVERLAY

/turf/open/indestructible/ground/outside/dirt
	name = "dirt"
	icon = 'icons/fallout/turfs/dirt.dmi'
	icon_state = "dirtfull"
//	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn, /obj/item/seeds/agave)
	slowdown = 0.3
	flags_1 = CAN_HAVE_NATURE
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

/turf/open/indestructible/ground/outside/dirt/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return //same thing here, dirt absorbs the liquid... :(

/turf/open/indestructible/ground/outside/dirt/north
	icon_state = "dirt"
	dir = NORTH

/turf/open/indestructible/ground/outside/dirt/south
	icon_state = "dirt"
	dir = SOUTH

/turf/open/indestructible/ground/outside/dirt/east
	icon_state = "dirt"
	dir = EAST

/turf/open/indestructible/ground/outside/dirt/west
	icon_state = "dirt"
	dir = WEST

// DARK DIRT - the legacy one
/turf/open/indestructible/ground/outside/dirt/dark


/turf/open/indestructible/ground/outside/dirt_s
	name = "dirt"
	icon_state = "bottomleft"
	icon = 'icons/fallout/turfs/dirtsnow.dmi'
//	step_sounds = list("human" = "dirtfootsteps")

/turf/open/indestructible/ground/outside/grass_s
	name = "grass"
	icon_state = "bottomleft"
	icon = 'icons/fallout/turfs/snowgrass.dmi'
//	step_sounds = list("human" = "dirtfootsteps")

/turf/open/indestructible/ground/outside/road
	name = "\proper road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphalt.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/road/horizontaltopborder
	icon_state = "horizontaltopborderbottom0"

/turf/open/indestructible/ground/outside/road/horizontalbottomborder
	icon_state = "horizontalbottombordertop0"

/turf/open/indestructible/ground/outside/road/verticalleftborder
	icon_state = "verticalleftborderright0"

/turf/open/indestructible/ground/outside/road/verticalrightborder
	icon_state = "verticalrightborderleft0"

/turf/open/indestructible/ground/outside/road/hor
	icon_state = "horizontalinnermain0"

/turf/open/indestructible/ground/outside/road/damagedhor
	icon_state = "horizontalinnermain1"

/turf/open/indestructible/ground/outside/road/damagedhor/heavy
	icon_state = "horizontalinnermain2"

/turf/open/indestructible/ground/outside/road/damagedhor/severe
	icon_state = "horizontalinnermain3"

/turf/open/indestructible/ground/outside/road/damagedhor/right
	icon_state = "horizontalinnermain2right"

/turf/open/indestructible/ground/outside/road/damagedhor/left
	icon_state = "horizontalinnermain2left"

/turf/open/indestructible/ground/outside/road/vert
	icon_state = "verticalinnermain0"

/turf/open/indestructible/ground/outside/road/damagedvert
	icon_state = "verticalinnermain1"

/turf/open/indestructible/ground/outside/road/damagedvert/heavy
	icon_state = "verticalinnermain2"

/turf/open/indestructible/ground/outside/road/damagedvert/top
	icon_state = "verticalinnermain2top"

/turf/open/indestructible/ground/outside/road/damagedvert/bottom
	icon_state = "verticalinnermain2bottom"

/turf/open/indestructible/ground/outside/road/stripyroad
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "wendoverblvd"
	dir = SOUTHEAST

/turf/open/indestructible/ground/outside/road/stripyroad/thick
	icon_state = "doubleyellow2"
	dir = WEST

/turf/open/indestructible/ground/outside/road/stripyroad/horizontal
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/road/stripyroad/horizontalthick
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/road/salt
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "saltyroad"
	dir = EAST

/turf/open/indestructible/ground/outside/road/salt/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/road_s
	name = "\proper road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphalt_s.dmi'
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/roadi80
	name = "\proper road"
	icon_state = "outermiddle"
	icon = 'icons/turf/f13road.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/roadi80/center
	name = "\proper road"
	icon_state = "outermiddlestripe"
	icon = 'icons/fallout/objects/wendover.dmi'

/turf/open/indestructible/ground/outside/roadi80/topyellow
	name = "\proper road"
	icon_state = "outerstripe"
	icon = 'icons/fallout/objects/wendover.dmi'
	dir = 4

/turf/open/indestructible/ground/outside/roadi80/topwhite
	name = "\proper road"
	icon_state = "outerstripe"
	icon = 'icons/fallout/objects/wendover.dmi'
	dir = 2

/turf/open/indestructible/ground/outside/roadi80/bottomyellow
	name = "\proper road"
	icon_state = "outerstripe"
	icon = 'icons/fallout/objects/wendover.dmi'
	dir = 8

/turf/open/indestructible/ground/outside/roadi80/bottomwhite
	name = "\proper road"
	icon_state = "outerstripe"
	icon = 'icons/fallout/objects/wendover.dmi'
	dir = 1

/turf/open/indestructible/ground/outside/sidewalk
	name = "\proper sidewalk"
	icon_state = "outermiddle"
	icon = 'icons/fallout/turfs/sidewalk.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/sidewalk/innerhorizontal
	icon_state = "horizontaloutermain0"

/turf/open/indestructible/ground/outside/sidewalk/innervertical
	icon_state = "verticaloutermain0"

/turf/open/indestructible/ground/outside/sidewalk/left
	icon_state = "verticalleftborderleft0"

/turf/open/indestructible/ground/outside/sidewalk/right
	icon_state = "verticalrightborderright0"

/turf/open/indestructible/ground/outside/sidewalk/top
	icon_state = "horizontaltopbordertop0"

/turf/open/indestructible/ground/outside/sidewalk/bottom
	icon_state = "horizontalbottomborderbottom0"

/turf/open/indestructible/ground/outside/sidewalk/damaged
	icon_state = "verticaloutermain1"

/turf/open/indestructible/ground/outside/sidewalk/damaged/heavy
	icon_state = "verticaloutermain2"

/turf/open/indestructible/ground/outside/sidewalk/damaged/top
	icon_state = "verticaloutermain2top"

/turf/open/indestructible/ground/outside/sidewalk/damaged/bottom
	icon_state = "verticaloutermain2bottom"

/turf/open/indestructible/ground/outside/sidewalk/damaged/horlight
	icon_state = "horizontaloutermain1"

/turf/open/indestructible/ground/outside/sidewalk/damaged/horheavy
	icon_state = "horizontaloutermain2"

/turf/open/indestructible/ground/outside/sidewalk/damaged/horright
	icon_state = "horizontaloutermain2right"

/turf/open/indestructible/ground/outside/sidewalk/damaged/horleft
	icon_state = "horizontaloutermain2left"

/turf/open/indestructible/ground/outside/sidewalk/pateo
	name = "pateo"
	icon = 'icons/turf/floors.dmi'
	icon_state = "asteroidfloor"

/turf/open/indestructible/ground/outside/sidewalk/walkway
	name = "walkway"
	icon = 'icons/turf/floors.dmi'
	icon_state = "sandstonevault"

/turf/open/indestructible/ground/outside/sidewalk/wastelandedge
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "dirtyroad"
	dir = NORTH

/turf/open/indestructible/ground/outside/sidewalk/wastelandedge/left
	dir = SOUTH

/turf/open/indestructible/ground/outside/sidewalk/wastelandedge/bottom
	dir = WEST

/turf/open/indestructible/ground/outside/sidewalk/wastelandedge/top
	dir = EAST

/turf/open/indestructible/ground/outside/sidewalk_s
	name = "\proper sidewalk"
	icon_state = "outermiddle"
	icon = 'icons/fallout/turfs/sidewalk_s.dmi'
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/ruins
	name = "ruins"
	desc = "It's just a pile of concrete rubble."
	icon_state = "rubblefull"
	icon = 'icons/fallout/turfs/ground.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/wood
	name = "\proper wood planks"
	icon_state = "housewood1"
	icon = 'icons/turf/floors.dmi'
	//	step_sounds = list("human" = "woodfootsteps")

/turf/open/indestructible/ground/outside/woodalt
	name = "\proper wood planks"
	icon_state = "wood"
	icon = 'icons/turf/floors.dmi'
	//	step_sounds = list("human" = "woodfootsteps")

/turf/open/indestructible/ground/outside/roof
	name = "roof"
	icon_state = "floorrusty"
	icon = 'icons/fallout/turfs/floors.dmi'
	//	step_sounds = list("human" = "woodfootsteps")

/turf/open/indestructible/ground/outside/roof/stairs
	name = "stairs"
	icon_state = "stairs"
	icon = 'icons/obj/stairs.dmi'

/turf/open/indestructible/ground/outside/roof/stairs/north
	name = "stairs"
	dir = NORTH

/turf/open/indestructible/ground/outside/roof/stairs/south
	name = "stairs"
	dir = SOUTH

/turf/open/indestructible/ground/outside/roof/stairs/east
	name = "stairs"
	dir = EAST

/turf/open/indestructible/ground/outside/roof/stairs/west
	name = "stairs"
	dir = WEST

/turf/open/indestructible/ground/outside/water
	gender = PLURAL
	name = "river water"
	desc = "Shallow river water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	slowdown = 2
	depth = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/indestructible/ground/outside/water/Initialize()
	. = ..()
	update_icon()

/turf/open/indestructible/ground/outside/water/Entered(atom/movable/AM, atom/oldloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, "<span class='warning'>You get drenched in water!</span>")
	AM.water_act(5)
	..()

/turf/open/indestructible/ground/outside/water/Exited(atom/movable/AM, atom/newloc)
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, "<span class='warning'>You climb out of \the [src].</span>")
	..()

/turf/open/indestructible/ground/outside/water/update_icon()
	. = ..()

/turf/open/indestructible/ground/outside/water/still
	icon_state = "riverwater"

/turf/open/indestructible/ground/outside/water/cavern
	icon_state = "riverwater"
	sunlight_state = NO_SUNLIGHT

/turf/open/indestructible/ground/outside/water/cavernriver
	sunlight_state = NO_SUNLIGHT

/turf/open/indestructible/ground/outside/snow
	initial_gas_mix = "o2=22;n2=82;TEMP=285"
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	desc = "Looks cold."
	icon_state = "snow"
	footstep = FOOTSTEP_SNOW
	barefootstep = FOOTSTEP_SNOW
	clawfootstep = FOOTSTEP_SNOW

/turf/open/indestructible/ground/outside/ruins/ex_act(severity, target)
	contents_explosion(severity, target)
	switch(severity)
		if(4)
			if(prob(5))
				ChangeTurf(baseturfs)
		if(3)
			if(prob(25))
				ChangeTurf(baseturfs)
		if(2)
			if(prob(50))
				ChangeTurf(baseturfs)
		if(1)
			ChangeTurf(baseturfs)

/////////////////////////////////////////////////////////

#define SHROOM_SPAWN_GROUND	1

/turf/open/indestructible/ground/inside/mountain
	name = "cave"
	icon_state = "rockfloor1"
	icon = 'icons/fallout/turfs/mining.dmi'
//	allowed_plants = list(/obj/item/seeds/glow)
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/inside/mountain/Initialize()
	. = ..()
	//If no fences, machines, etc. try to plant mushrooms
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		plantShrooms()
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(istype(turf_to_check, /turf/open/water))
			var/obj/effect/overlay/rockfloor_side/DS = new /obj/effect/overlay/rockfloor_side(src)
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = turn(direction, 180)

/obj/effect/overlay/rockfloor_side
	name = "cave"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "rockfloor_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/turf/open/indestructible/ground/inside/mountain/proc/plantShrooms()
	if(prob(SHROOM_SPAWN_GROUND))
		turfPlant = new /obj/structure/flora/wasteplant/wild_fungus(src)
		. = TRUE //in case we ever need this to return if we spawned
		return.

/turf/open/indestructible/ground/inside/mountain/New()
	..()
	icon_state = "rockfloor[rand(1,2)]"

/turf/open/indestructible/ground/inside/dirt
	name = "dirt"
	icon_state = "dirtfull"
//	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn, /obj/item/seeds/agave)
	slowdown = 0.2
	flags_1 = CAN_HAVE_NATURE

/turf/open/indestructible/ground/inside/subway
	name = "subway tunnel"
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "railsnone"

/turf/open/indestructible/ground/inside/subway/Initialize()
	. = ..()
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(istype(turf_to_check, /turf/open))
			var/obj/effect/overlay/railsnone_side/DS = new /obj/effect/overlay/railsnone_side(src)
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = turn(direction, 180)

/obj/effect/overlay/railsnone_side
	name = "cave"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "railsnone_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE


/turf/open/indestructible/ground/outside/roaddirt
	name = "road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphaltdirt.dmi'
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/sidewalkdirt
	name = "sidewalk"
	icon_state = "outermiddle"
	icon = 'icons/fallout/turfs/sidewalkdirt.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
//	step_sounds = list("human" = "erikafootsteps")

//Obsolete but used in yucky Pahrump
/turf/open/indestructible/ground/outside/graveldirt
	name = "gravel"
	icon_state = "graveldirt"
	icon = 'icons/fallout/turfs/ground.dmi'
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_GRAVEL
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/graveldirt/pink
	icon = 'icons/turf/mining.dmi'
	icon_state = "ash"

/turf/open/indestructible/ground/outside/graveldirt/alt
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "gravel"

/turf/open/indestructible/ground/outside/graveldirt/alt/dark
	sunlight_state = NO_SUNLIGHT

// New gravel, organized. Use directions for control. - Pebbles
/turf/open/indestructible/ground/outside/gravel
	name = "gravel"
	icon_state = "gravel"
	icon = 'icons/fallout/turfs/gravel.dmi'
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_GRAVEL

// New gravel, organized. Use directions for control. - Pebbles
/turf/open/indestructible/ground/outside/f13flatzgravel
	name = "gravel"
	icon_state = "flatzgraveledge"
	icon = 'icons/fallout/turfs/f13flatzgravel.dmi'
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_GRAVEL

/turf/open/indestructible/ground/outside/gravel/alt
	name = "gravel"
	icon_state = "gravel_alt"

/turf/open/indestructible/ground/outside/gravel/path_desert
	name = "gravel path"
	icon_state = "path_desert"

/turf/open/indestructible/ground/outside/gravel/path_desert/intersection
	name = "gravel path"
	icon_state = "path_desert_intersection"

/turf/open/indestructible/ground/outside/gravel/path_desert/intersection/alt
	name = "gravel path"
	icon_state = "gravel"

/turf/open/indestructible/ground/outside/gravel/path_desert/end
	name = "gravel path"
	icon_state = "path_desert_end"

/turf/open/indestructible/ground/outside/gravel/path_dirt
	name = "gravel path"
	icon_state = "path_dirt"

/turf/open/indestructible/ground/outside/gravel/path_dirt/intersection
	name = "gravel path"
	icon_state = "path_dirt_intersection"

/turf/open/indestructible/ground/outside/gravel/path_dirt/end
	name = "gravel path"
	icon_state = "path_dirt_end"

/turf/open/indestructible/ground/outside/gravel/path_dirt/end
	name = "gravel path"
	icon_state = "path_dirt_end"

/turf/open/indestructible/ground/outside/gravel/northedge
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "gravelondesert"
	dir = 1

/turf/open/indestructible/ground/outside/gravel/southedge
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "gravelondesert"
	dir = 2

/turf/open/indestructible/ground/outside/gravel/roadnorthedge
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "gravelsiding"
	dir = 2

/turf/open/indestructible/ground/outside/gravel/roadsouthedge
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "gravelsiding"
	dir = 1

/turf/open/indestructible/ground/outside/gravel/Interstate80
	name = "Interstate 80"
	desc = "The sacred symbol of the 80s. Said to be visible from space."
	icon = 'icons/fallout/objects/wendover.dmi'
	icon_state = "crippledome6"

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter
	icon_state = "crippledome3"
	name = "Interstate 80"

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/i
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/n
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/t
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/e
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/rs
	dir = SOUTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/t2
	icon_state = "crippledome4"
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/a
	icon_state = "crippledome4"
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/t3
	icon_state = "crippledome4"
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/letter/e2
	icon_state = "crippledome4"
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c
	icon_state = "crippledome"
	name = "Interstate 80"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2
	icon_state = "crippledome2"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c2/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3
	icon_state = "crippledome3"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c3/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4
	icon_state = "crippledome4"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c4/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5
	icon_state = "crippledome5"
	desc = "Two men enter, one man leaves. That's the way of the road, Bubs."

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c5/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6
	icon_state = "crippledome6"
	desc = "Dulce et decorum est pro via mori."

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c6/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7
	icon_state = "crippledome7"
	desc = "We who are about to die salute you."

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c7/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8
	icon_state = "crippledome8"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c8/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9
	icon_state = "crippledome9"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c9/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10
	icon_state = "crippledome10"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c10/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11
	icon_state = "crippledome11"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/west
	dir = WEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/northwest
	dir = NORTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/northeast
	dir = NORTHEAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/southeast
	dir = SOUTHEAST	

/turf/open/indestructible/ground/outside/gravel/Interstate80/c11/southwest
	dir = SOUTHWEST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c12
	icon_state = "crippledome12"

/turf/open/indestructible/ground/outside/gravel/Interstate80/c12/south
	dir = SOUTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c12/north
	dir = NORTH

/turf/open/indestructible/ground/outside/gravel/Interstate80/c12/east
	dir = EAST

/turf/open/indestructible/ground/outside/gravel/Interstate80/c12/west
	dir = WEST

/turf/open/indestructible/ground/outside/lifelessdesert // temporary fix until someone can make proper deserts tile that doesn't spawn plants
	name = "desert"
	icon_state = "wasteland"
	icon = 'icons/fallout/turfs/ground.dmi'
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

/turf/open/indestructible/ground/outside/lifelessdesert/wendoverwillsafecorner // this is weird code needed to stop the buggy from driving in a way that clips with the statue
	name = "desert"

/turf/open/indestructible/ground/outside/fakeelevation
	name = "fake elevation"
	icon = 'icons/fallout/turfs/floors.dmi'
	icon_state = "stagestairs"
	var/blocked_direction = list(NORTH, NORTHEAST, NORTHWEST) // as an example

/turf/open/indestructible/ground/outside/fakeelevation/CanPass(atom/movable/mover, border_dir)
    if(istype(mover) && (mover.pass_flags & PASSTABLE))
        return !density
    if(istype(mover) && (mover.dir in blocked_direction))
        return density
    else
        return TRUE

/turf/open/indestructible/ground/outside/fakeelevation/wendoverwillsafecorner
	name = "desert"
	icon_state = "wasteland"
	icon = 'icons/fallout/turfs/ground.dmi'
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND

// Two edge smootheners for the new gravel turf
/obj/effect/overlay/gravel/edge
	name = "gravel edge"
	icon = 'icons/fallout/turfs/gravel.dmi'
	icon_state = "graveledge"
	plane = FLOOR_PLANE
	layer = LOW_OBJ_LAYER

/obj/effect/overlay/gravel/edge/corner
	icon_state = "gravelcorner"
	plane = FLOOR_PLANE
	layer = LOW_OBJ_LAYER

/obj/effect/overlay/gravel/edge/north
	name = "gravel edge"
	dir = NORTH

/obj/effect/overlay/gravel/edge/south
	name = "gravel edge"
	dir = SOUTH

/obj/effect/overlay/gravel/edge/east
	name = "gravel edge"
	dir = EAST

/obj/effect/overlay/gravel/edge/west
	name = "gravel edge"
	dir = WEST


