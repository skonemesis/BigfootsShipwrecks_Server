/*
 * Bigfoot's Shipwrecks - Add Items to Crate
 * Updated by: sko & Ghost PGM DEV TEAM
 *
 * Adds randomized loot to a crate based on configured loot settings.
 */

if (!isServer) exitWith {};

// Define private variables
private ["_actualCount", "_actualAdditionalCount", "_cargoItems", "_chance", "_class", "_count", "_crate", "_enableCrateFillDebug", "_minCount", "_possibleAdditionalCount", "_wreckId"];

// Extract parameters
_wreckId = _this select 0;                 // Unique ID for the wreck
_crate = _this select 1;                   // Crate object
_cargoItems = _this select 2;              // List of items to be added to the crate
_enableCrateFillDebug = _this select 3;    // Boolean to enable debugging logs

// Loop through each loot entry
{
    _class = _x select 0;                  // Item class or array of possible items
    _minCount = _x select 1;               // Guaranteed number of items
    _possibleAdditionalCount = _x select 2;// Max additional random items
    _chance = _x select 3;                 // Spawn chance (percentage)

    // Only add item if the random roll is successful
    if (_chance > random 100) then 
    {
        // If multiple possible items, pick one at random
        if (typeName _class == "ARRAY") then
        {
            _class = selectRandom _class;
        };

        // Determine final item count
        _actualAdditionalCount = floor(random (_possibleAdditionalCount + 1));
        _actualCount = _minCount + _actualAdditionalCount;
        
        // Add item to crate
        _crate addItemCargoGlobal [_class, _actualCount];

        // Log addition if debugging is enabled
        if (_enableCrateFillDebug) then 
        {
            format["Added [%1] [%2] to crate [%3].", _actualCount, _class, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
        };
    };
} foreach _cargoItems;

/*
 * Bigfoot's Shipwrecks - Add Items to Crate
 * Updated by: sko & Ghost PGM DEV TEAM
 *
 * Adds randomized loot to a crate based on configured loot settings.
 */

if (!isServer) exitWith {};

// Define private variables
private ["_actualCount", "_actualAdditionalCount", "_cargoItems", "_chance", "_class", "_count", "_crate", "_enableCrateFillDebug", "_minCount", "_possibleAdditionalCount", "_wreckId"];

// Extract parameters
_wreckId = _this select 0;                 // Unique ID for the wreck
_crate = _this select 1;                   // Crate object
_cargoItems = _this select 2;              // List of items to be added to the crate
_enableCrateFillDebug = _this select 3;    // Boolean to enable debugging logs

// Loop through each loot entry
{
    _class = _x select 0;                  // Item class or array of possible items
    _minCount = _x select 1;               // Guaranteed number of items
    _possibleAdditionalCount = _x select 2;// Max additional random items
    _chance = _x select 3;                 // Spawn chance (percentage)

    // Only add item if the random roll is successful
    if (_chance > random 100) then 
    {
        // If multiple possible items, pick one at random
        if (typeName _class == "ARRAY") then
        {
            _class = selectRandom _class;
        };

        // Determine final item count
        _actualAdditionalCount = floor(random (_possibleAdditionalCount + 1));
        _actualCount = _minCount + _actualAdditionalCount;
        
        // Add item to crate
        _crate addItemCargoGlobal [_class, _actualCount];

        // Log addition if debugging is enabled
        if (_enableCrateFillDebug) then 
        {
            format["Added [%1] [%2] to crate [%3].", _actualCount, _class, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
        };
    };
} foreach _cargoItems;


/*
 * This file is subject to the terms and conditions defined in
 * file 'LICENSE.txt', which is part of this source code package.

 
if (!isServer) exitWith {};

private ["_actualCount", "_actualAdditionalCount", "_cargoItems", "_chance", "_class", "_count", "_cargoItems", "_crate", "_enableCrateFillDebug", "_minCount", "_possibleAdditionalCount", "_wreckId"];

_wreckId = _this select 0;
_crate = _this select 1;
_cargoItems = _this select 2;
_enableCrateFillDebug = _this select 3;

{
    _class = _x select 0;
    _minCount = _x select 1;
    _possibleAdditionalCount = _x select 2;
    _chance = _x select 3;

    if (_chance > random 100) then {
        if (typeName _class == "ARRAY") then
        {
            _class = _class call BIS_fnc_selectRandom;
        };

        _actualAdditionalCount = floor(random (_possibleAdditionalCount + 1));
        _actualCount = _minCount + _actualAdditionalCount;
        _crate addItemCargoGlobal [_class, _actualCount];

        if (_enableCrateFillDebug) then {
            format["Added [%1] [%2] to crate [%3].", _actualCount, _class, _wreckId] call ExileServer_BigfootsShipwrecks_util_logCommand;
        };
    };
} foreach _cargoItems;
*/
