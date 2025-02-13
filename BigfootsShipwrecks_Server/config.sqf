/*
 * Bigfoot's Shipwrecks - Configuration
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This file contains all configurable settings for the shipwreck spawner.
 */

BS_debug_logCrateFill = true; // Log items spawned in crates to server RPT logs.

BS_player_showCrateClaimMessage = true; // Show notification when players approach a crate
BS_player_showCrateClaimMessageRadius = 20; // Distance (meters) to trigger notification

// Supply crates that can spawn at shipwrecks
BS_class_crate = 
[
    "Exile_Container_SupplyBox", // Default supply box
    "Box_NATO_Ammo_F",           // NATO ammo crate
    "Box_East_Ammo_F",           // CSAT ammo crate
    "Box_IND_Ammo_F",            // AAF ammo crate
    "Box_FIA_Ammo_F",            // Resistance ammo crate
    "B_Slingload_01_Cargo_F"     // Large slingload cargo box
];

// Shipwreck objects
BS_class_wreckage = 
[
    "Land_Wreck_Traw_F",   // Fishing trawler
    "Land_UWreck_FishingBoat_F", // Underwater wrecked fishing boat
    "Land_Wreck_Carrier_F" // Aircraft carrier wreck
];

BS_count_Shipwrecks = 5; // Number of shipwrecks to spawn

BS_locations_crateWreckOffset = 10; // Distance from wreck to spawn crate.

BS_locations_center = [8000, 8000, 0]; // Approximate center of the map.

BS_locations_distance_min = 500;  // Ensures some wrecks are close to shore.
BS_locations_distance_max = 7000; // Keeps most wrecks offshore but within the map.

BS_loot_enablePoptabs = true; // Enable poptab rewards.

BS_loot_count_poptabs_seed = 
[
    500,   0.2,  // 20% chance to get 500 poptabs (low-end)
    5000,  0.6,  // 60% chance to get 5,000 poptabs (common)
    50000, 0.05  // 5% chance to get 50,000 poptabs (rare jackpot)
];

// Crate loot settings
BS_loot_itemCargo = 
[
    // High-Tier Military Gear
    [["NVGoggles", "NVGoggles_INDEP", "NVGoggles_OPFOR"], 1, 0, 100], // Night vision
    [["V_PlateCarrier1_rgr", "V_PlateCarrierGL_mtp", "V_TacVest_blk"], 1, 0, 80], // Tactical vests
    [["B_Carryall_mcamo", "B_Carryall_oli", "B_AssaultPack_blk"], 1, 0, 70], // Backpacks

    // Weapons & Ammo
    [["arifle_SDAR_F", "SMG_05_F"], 1, 0, 80], // Underwater weapons
    [["20Rnd_556x45_UW_mag", "30Rnd_9x21_Mag_SMG_02"], 3, 2, 80], // Underwater ammo

    // Attachments
    [["optic_DMS", "optic_Holosight", "optic_ERCO_blk_F"], 1, 1, 60], // Scopes
    [["muzzle_snds_H", "muzzle_snds_M"], 1, 1, 40], // Suppressors
    [["acc_pointer_IR", "acc_flashlight"], 1, 1, 50], // Lasers & lights
    [["bipod_01_F_blk"], 1, 1, 30], // Bipods

    // Explosives
    [["HandGrenade", "MiniGrenade"], 1, 1, 40], // Grenades
    [["IEDUrbanSmall_Remote_Mag", "DemoCharge_Remote_Mag"], 1, 1, 20], // Mid-tier explosives
    [["SatchelCharge_Remote_Mag"], 0, 1, 10], // Rare high-tier explosive

    // Utility & Survival Gear
    [["Exile_Item_InstaDoc", "Exile_Item_Bandage"], 3, 2, 85], // Medical supplies
    [["Exile_Item_PowerDrink", "Exile_Item_PlasticBottleFreshWater"], 2, 2, 90], // Drinks
    [["Exile_Item_EMRE", "Exile_Item_Moobar"], 2, 2, 90], // Food

    // Bonus Items
    ["Exile_Item_SafeKit", 0, 1, 10], // Base-building item
    ["Exile_Item_CodeLock", 0, 1, 20], // Base security upgrade
    ["Exile_Item_XM8", 0, 1, 30], // Tactical tablet
    ["Exile_Item_RubberDuck", 0, 2, 14] // Legendary Rubber Duck
];

// Broadcast these variables to the server
publicVariable "BS_debug_logCrateFill";
publicVariable "BS_player_showCrateClaimMessage";
publicVariable "BS_player_showCrateClaimMessageRadius";
publicVariable "BS_class_crate";
publicVariable "BS_class_wreckage";
publicVariable "BS_count_Shipwrecks";
publicVariable "BS_locations_crateWreckOffset";
publicVariable "BS_locations_center";
publicVariable "BS_locations_distance_min";
publicVariable "BS_locations_distance_max";
publicVariable "BS_loot_enablePoptabs";
publicVariable "BS_loot_count_poptabs_seed";
publicVariable "BS_loot_itemCargo";

/*
 * This file is subject to the terms and conditions defined in
 * file 'APL-SA LICENSE.txt', which is part of this source code package.


/////// This Code modified by Ketanna to automatically populate the map center and 2 water depth variables were added to allow player the ability to 
//////  declare how deep or how shallow the ship wrecks occure. The ship wreck icon was also changed to show only a blue ship icon.
BS_debug_logCrateFill = true; // True to log items spawned in crates to server .RPT, usually right after [Display #24]
BS_player_showCrateClaimMessage = true; // True to show toast and chat notification with coordinates to all players when any players are close to crate
BS_player_showCrateClaimMessageRadius = 20; // Players must be this close (in meters) to trigger serverwide chat/toast notification
BH_class_crate = 
[
    // Supply crates
    "Exile_Container_SupplyBox",     // Default supply box
    "Box_NATO_Ammo_F",               // NATO ammo crate (military)
    "Box_East_Ammo_F",               // CSAT ammo crate (Eastern bloc theme)
    "Box_IND_Ammo_F",                // AAF ammo crate (neutral)
    "Box_FIA_Ammo_F",                // Resistance ammo crate (wooden style)
    "Box_NATO_Wps_F",                // NATO weapon cache
    "Box_East_Wps_F",                // CSAT weapon cache
    "Box_IND_Wps_F",                 // AAF weapon cache
    "Box_FIA_Wps_F",                 // Resistance weapon cache (rugged wooden box)
    "B_CargoNet_01_ammo_F",          // NATO large ammo cargo net
    "O_CargoNet_01_ammo_F",          // CSAT large ammo cargo net
    "Land_Pod_Heli_Transport_04_ammo_F", // Helicopter ammo pod (great for heli wrecks)
    "Box_Syndicate_Wps_F",           // Apex Syndikat weapons (smuggler-style)
    "B_Slingload_01_Cargo_F",        // Large slingload cargo box (great for treasure missions)
    "B_CargoNet_01_box_F",           // NATO cargo net with supplies
    "O_CargoNet_01_box_F"            // CSAT cargo net with supplies (last item, no comma)
];

BH_class_wreckage = 
[
	"Land_WoodenCrate_01_F",        // Old wooden cargo crate (perfect for shipwrecks)
    "Land_WoodenCrate_01_stack_x5_F", // Large wooden crate stack (bigger shipwrecks)
    "Land_WoodenCrate_01_stack_x3_F", // Medium wooden crate stack
    "Land_CargoBox_V1_F",           // General cargo box (neutral, fits everywhere)
    "Land_Cargo20_military_green_F", // 20ft military cargo container
    "Land_Cargo20_grey_F",          // 20ft civilian cargo container
    "Land_Cargo40_red_F"            // Large 40ft red shipping container (deep-sea wrecks)
];

BS_count_shipwrecks = 3; // Total wrecks
BS_locations_crateWreckOffset = 10; // Distance from wreck to spawn crate.

//////////	 AUTO Map Configure added by Ketanna 	/////////////////////
//////////	This script automatically finds the map center and calculates where to place crates.	/////////////////////
private _MapCenter = worldSize / 2;
BS_locations_center = [_MapCenter,_MapCenter,0];// this code automatically finds the map center
BS_locations_distance_min = 0;					// Minimum distance from BS_location_center to spawn crate.
BS_locations_distance_max =  _MapCenter - 2000;	// this code automatically adjust the max distance from the edge of the map by 2000

////////////// Water Depth check for crate spawns added by Ketanna  ////////////////
///// This script based on your settings will limit how deep or shallow the water is where the crates spawn... no more deep deep water if desired
BS_locations_WaterDepth_max = 25;				// the max water depth you want your crates to spawn in 
BS_locations_WaterDepth_MIN = 5;				// the min water depth you want your crates to spawn in
BS_loot_enablePoptabs = true;					// True to spawn random number of poptabs in crates, otherwise false.
BH_loot_count_poptabs_seed = 
[
    500,   0.2,  // 20% chance to get 500 poptabs (low-end)
    5000,  0.6,  // 60% chance to get around 5,000 poptabs (common)
    50000, 0.05  // 5% chance to get 50,000 poptabs (rare jackpot)
];
BS_loot_itemCargo = // Items to put in loot crate.
[   // [class (if array, picks one random item), guaranteed amount, possible random additional amount, % chance of spawning additional random amount]
	
	// High-Tier Military Gear (Guaranteed)
	[["NVGoggles_tna_F", "NVGoggles", "O_NVGoggles_hex_F"], 1, 0, 100], 		// Night vision
	[["V_PlateCarrier1_rgr", "V_PlateCarrierGL_mtp", "V_TacVest_blk"], 1, 0, 80], // Tactical vests
	[["B_Carryall_mcamo", "B_Carryall_oli", "B_AssaultPack_blk"], 1, 0, 70], 	// Backpacks

	// Weapons (Each Comes With Limited Ammo)
	[["arifle_MX_Black_F", "arifle_SPAR_03_blk_F"], 1, 0, 50], 					// Rifles
	[["LMG_Mk200_F", "LMG_Zafir_F"], 1, 0, 35], 								// Light machine guns
	[["srifle_DMR_06_camo_F", "srifle_DMR_07_blk_F"], 1, 0, 30], 				// Sniper rifles
	[["hgun_P07_khk_F", "hgun_ACPC2_F"], 1, 0, 50], 							// Sidearms

	// Ammo (Limited, But Always Spawns With Weapons)
	[["30Rnd_65x39_caseless_mag", "30Rnd_556x45_Stanag"], 2, 1, 80], 			// Rifle ammo
	[["200Rnd_65x39_cased_Box", "150Rnd_762x54_Box"], 1, 1, 50], 				// LMG ammo
	[["10Rnd_338_Mag", "10Rnd_762x51_Mag"], 2, 1, 70], 							// Sniper ammo
	[["16Rnd_9x21_Mag", "11Rnd_45ACP_Mag"], 2, 1, 80], 							// Pistol ammo

	// Attachments (Common)
	[["optic_DMS", "optic_Holosight", "optic_ERCO_blk_F"], 1, 1, 60], 			// Scopes
	[["muzzle_snds_H", "muzzle_snds_M"], 1, 1, 40], 							// Suppressors
	[["acc_pointer_IR", "acc_flashlight"], 1, 1, 50], 							// Lasers & lights
	[["bipod_01_F_blk"], 1, 1, 30], 											// Bipods

	// Explosives (Slightly More Common Than Before)
	[["HandGrenade", "MiniGrenade"], 1, 1, 60], 								// Grenades
	[["IEDUrbanSmall_Remote_Mag", "DemoCharge_Remote_Mag"], 1, 1, 20], 			// Mid-tier explosives
	[["SatchelCharge_Remote_Mag"], 0, 1, 10], 									// Rare high-tier explosive
	[["APERSBoundingMine_Range_Mag"], 4, 2, 50],								// APERS Bounding mines

	// Utility & Survival Gear
	[["Exile_Item_InstaDoc", "Exile_Item_Bandage"], 3, 2, 85], 					// Medical supplies
	[["Exile_Item_DuctTape", "Exile_Item_ExtensionCord"], 2, 2, 80], 			// Crafting materials
	[["Exile_Item_PowerDrink", "Exile_Item_PlasticBottleFreshWater"], 2, 2, 90], // Drinks
	[["Exile_Item_EMRE", "Exile_Item_Moobar"], 2, 2, 90], 						// Food

	// Bonus Items (Rare High-Value Loot)
	["Exile_Item_SafeKit", 0, 1, 10], 											// Extremely rare base-building item
	["Exile_Item_CodeLock", 0, 1, 20], 											// Base security upgrade
	["Exile_Item_XM8", 0, 1, 30], 												// Tactical tablet
	["Exile_Item_RubberDuck", 0, 2, 14], 										// Legendary Rubber Duck (for fun)
	
	["CUP_item_CDF_dogtags", 1, 2, 30],
	
	["Exile_Item_Cement", 3, 4, 50],
	["Exile_Item_Sand", 3, 5, 50],
	["Exile_Item_FuelCanisterEmpty", 0, 2, 50],
	
	
	["Exile_Item_Codelock", 0, 2, 30],
	["Exile_Item_PortableGeneratorKit", 0, 1, 15],
	
    ["Exile_Item_ConcreteWallKit", 4, 1, 25],
    ["Exile_Item_ConcreteFloorKit", 3, 1, 25],
    ["Exile_Item_FortificationUpgrade", 1, 2, 50],
	
    ["Exile_Item_Knife", 0, 1, 50]												// No knives guaranteed, but 25% of the time an additional 0-1 knives could spawn.
]; 

publicVariable "BS_debug_logCrateFill";
publicVariable "BS_player_showCrateClaimMessage";
publicVariable "BS_player_showCrateClaimMessageRadius";
publicVariable "BS_class_crate";
publicVariable "BS_class_wreckage";
publicVariable "BS_count_shipwrecks";
publicVariable "BS_locations_crateWreckOffset";
publicVariable "BS_locations_center";
publicVariable "BS_locations_distance_min";
publicVariable "BS_locations_distance_max";
publicVariable "BS_loot_enablePoptabs";
publicVariable "BS_loot_count_poptabs_seed";
publicVariable "BS_loot_itemCargo";
*/
