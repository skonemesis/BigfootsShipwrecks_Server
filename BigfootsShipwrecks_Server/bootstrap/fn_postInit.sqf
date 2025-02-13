/*
 * postInit.sqf - Bigfoot's Shipwrecks
 * 
 * Loads config values and starts the shipwreck spawner after the mission initializes.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM
 */

"PostInit started..." call ExileServer_BigfootsShipwrecks_util_logCommand;

// Load server configuration
call compile preprocessFileLineNumbers "BigfootsShipwrecks_Server\config.sqf";

// Start the shipwreck spawning system
[] call ExileServer_BigfootsShipwrecks_initialize;

"PostInit finished" call ExileServer_BigfootsShipwrecks_util_logCommand;
