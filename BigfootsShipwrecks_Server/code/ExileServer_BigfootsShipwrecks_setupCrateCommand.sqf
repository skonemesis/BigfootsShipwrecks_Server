/*
 * ExileServer_BigfootsShipwrecks_setupCrateCommand.sqf
 *
 * Prepares a crate by locking it and preventing simulation to optimize performance.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM
 */

if (!isServer) exitWith {};

// Extract crate object from parameters
private ["_crate"];
_crate = _this select 0;

// Ensure the crate is valid before applying settings
if (!isNull _crate) then
{
    // Lock crate to prevent interaction until conditions are met
    _crate allowDamage false;
    _crate enableSimulationGlobal false;

    // Log crate setup completion
    format["Crate [%1] setup complete.", _crate] call ExileServer_BigfootsShipwrecks_util_logCommand;
};
