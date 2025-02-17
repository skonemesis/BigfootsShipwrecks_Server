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

// BS_locations_center = [8000, 8000, 0]; // Approximate center of the map.
BS_locations_center = [7680, 7680, 0];
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
