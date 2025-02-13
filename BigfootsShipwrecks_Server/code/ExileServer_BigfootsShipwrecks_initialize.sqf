/*
 * Bigfoot's Shipwrecks - Initialization Script
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This script initializes the shipwreck spawning system, ensuring that 
 * wrecks and loot crates appear at random ocean locations on server start.
 * 
 * Key Features:
 * - Spawns configurable shipwrecks with loot crates.
 * - Places markers on wreck locations.
 * - Monitors shipwreck areas for player interactions.
 * - Notifies all players when a crate has been claimed.
 *
 * Configurable Variables (Defined in config.sqf):
 * - BS_count_shipwrecks: Number of shipwreck events.
 * - BS_locations_center: Center position for shipwreck spawning.
 * - BS_locations_distance_min: Minimum distance from center.
 * - BS_locations_distance_max: Maximum distance from center.
 * - BS_class_wreckage: Types of shipwreck objects to spawn.
 * - BS_class_crate: Types of loot crates to spawn.
 * - BS_loot_itemCargo: Loot items available in crates.
 * - BS_loot_count_poptabs_seed: Randomized poptab distribution.
 * - BS_debug_logCrateFill: Enables logging of loot contents.
 */

if (!isServer) exitWith {};

"Starting initialization..." call ExileServer_BigfootsShipwrecks_util_logCommand;

// Spawns shipwrecks with loot crates at server start
[
    BS_count_shipwrecks, // Wreck count
    [ // Positioning (center, min, max)
        BS_locations_center,
        BS_locations_distance_min,
        BS_locations_distance_max

    ], 
    BS_class_wreckage, // Wreckage class
    BS_class_crate, // Crate class
    BS_loot_itemCargo, // Crate cargo
    BS_loot_count_poptabs_seed, // Crate poptabs seed (generated random poptab amount)
    BS_debug_logCrateFill // Enable logging of items added to crate (true/false)
] call ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand;

// Handles marker cleanup and player detection
uiSleep 5; // TODO: is 15 really needed?
[
    10, 
    ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand, 
    [
        BS_count_shipwrecks, 
        BS_player_showCrateClaimMessageRadius,
        BS_player_showCrateClaimMessage
    ], 
    true
] call ExileServer_system_thread_addTask;

"Finished initialization." call ExileServer_BigfootsShipwrecks_util_logCommand;

["systemChatRequest", ["Bigfoot's Shipwrecks Initialized"]] call ExileServer_system_network_send_broadcast;

true;
