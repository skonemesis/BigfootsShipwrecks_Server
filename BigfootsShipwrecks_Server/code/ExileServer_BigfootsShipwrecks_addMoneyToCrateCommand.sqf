/*
 * Bigfoot's Shipwrecks - Add Money to Crate
 * Updated by: sko & Ghost PGM DEV TEAM
 *
 * Adds a random amount of poptabs to a crate based on a configured probability distribution.
 */

if (!isServer) exitWith {};

// Define private variables
private ["_countPoptabs", "_crate", "_enableCrateFillDebug", "_randomDistributionSeed", "_wreckId"];

// Extract parameters
_wreckId = _this select 0;                   // Unique ID for the wreck
_crate = _this select 1;                     // Crate object
_randomDistributionSeed = _this select 2;    // Weighted random distribution
_enableCrateFillDebug = _this select 3;      // Boolean to enable debugging logs

// Select a random poptab amount based on weighted probability
_countPoptabs = _randomDistributionSeed selectRandomWeighted [500, 0.2, 5000, 0.6, 50000, 0.05];

// Store money in crate
_crate setVariable ["ExileMoney", _countPoptabs, true];

// Log poptab addition if debugging is enabled
if (_enableCrateFillDebug) then 
{
    format["💰 Crate [%2] received [%1] poptabs.", _countPoptabs, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
};


/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.

 
if (!isServer) exitWith {};

private ["_countPoptabs", "_crate", "_enableCrateFillDebug", "_randomDistributionSeed", "_wreckId"];

_wreckId = _this select 0;
_crate = _this select 1;
_randomDistributionSeed = _this select 2;
_enableCrateFillDebug = _this select 3;

_countPoptabs = floor(random _randomDistributionSeed);
_crate setVariable ["ExileMoney", _countPoptabs, true];

if (_enableCrateFillDebug) then 
{
    format["Added [%1] poptabs to crate [%2].", _countPoptabs, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
};
*/
