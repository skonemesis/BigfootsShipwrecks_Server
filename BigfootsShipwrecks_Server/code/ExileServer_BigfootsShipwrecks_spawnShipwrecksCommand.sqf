/*
 * Bigfoot's Shipwrecks - Spawn Shipwrecks Command
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This script handles the spawning of shipwrecks at random locations based on configuration settings.
 * It ensures safe positioning, creates wrecks and crates, and logs important details.
 *
 * Key Features:
 * - Spawns shipwrecks in random locations using `BIS_fnc_findSafePos`.
 * - Creates loot crates near wrecks.
 * - Logs the process for debugging and tracking.
 *
 * Configurable Variables (Defined in config.sqf):
 * - BS_count_shipwrecks: Number of shipwrecks to spawn.
 * - BS_locations_center: Center position for wreck spawn area.
 * - BS_locations_distance_min: Minimum spawn distance from the center.
 * - BS_locations_distance_max: Maximum spawn distance from the center.
 * - BS_class_wreckage: List of possible shipwreck types.
 * - BS_class_crate: List of possible loot crate types.
 * - BS_loot_itemCargo: List of possible loot items.
 * - BS_loot_count_poptabs_seed: Randomized poptab rewards.
 * - BS_debug_logCrateFill: Enables logging for debugging.
 */

if (!isServer) exitWith {};

private ["_wreckagePosition", "_wreck", "_wreckType", "_crate", "_crateType", "_cratePosition"];

// Log function start
["Starting Shipwreck Spawn Process..."] call ExileServer_BigfootsShipwrecks_util_logCommand;

// Ensure the wreck count variable is defined correctly
private _wreckCount = BS_count_shipwrecks; // Standardized variable name

// Validate wreck count before proceeding
if (isNil "_wreckCount" || { _wreckCount <= 0 }) exitWith 
{
    ["ERROR: Invalid wreck count! Check `BS_count_shipwrecks` in config.sqf"] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

// Loop to spawn wrecks
for "_i" from 1 to _wreckCount do
{
    _wreckagePosition = [BS_locations_center, BS_locations_distance_min, BS_locations_distance_max, 0, 0, 10, 0] call BIS_fnc_findSafePos;
    
    // Validate spawn position
    if (count _wreckagePosition == 0) then 
    {
        ["WARNING: Could not find a safe position for wreck spawn!"] call ExileServer_BigfootsShipwrecks_util_logCommand;
        continue;
    };

    _wreckType = selectRandom BS_class_wreckage;
    _wreck = createVehicle [_wreckType, _wreckagePosition, [], 0, "NONE"];
    _wreck setVectorUp surfaceNormal _wreckagePosition;

    ["Spawned wreck: " + str _wreckType + " at " + str _wreckagePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

    _crateType = selectRandom BS_class_crate;
    _cratePosition = _wreckagePosition getPos [BS_locations_crateWreckOffset, random 360];
    _crate = createVehicle [_crateType, _cratePosition, [], 0, "CAN_COLLIDE"];

    ["Spawned crate: " + str _crateType + " at " + str _cratePosition] call ExileServer_BigfootsShipwrecks_util_logCommand;
};

["Finished spawning Shipwrecks."] call ExileServer_BigfootsShipwrecks_util_logCommand;
