/*
 * preInit.sqf - Bigfoot's Shipwrecks
 * 
 * This script pre-compiles core functions before the mission starts.
 * Ensures all server functions are loaded into the mission namespace.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM
 */

private["_code"];

{
    _code = compileFinal (preprocessFileLineNumbers (_x select 1));
    missionNamespace setVariable [(_x select 0), _code];
}
forEach
[
    ['ExileServer_BigfootsShipwrecks_addItemsToCrateCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_addItemsToCrateCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_addMoneyToCrateCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_createShipwreckMarkerCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery.sqf'],
    ['ExileServer_BigfootsShipwrecks_initialize', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_initialize.sqf'],
    ['ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_maintainShipwrecksCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_sendClientNotificationCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_sendClientNotificationCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_setupCrateCommand',
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_setupCrateCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_spawnShipwrecksCommand.sqf'],
    ['ExileServer_BigfootsShipwrecks_util_logCommand', 
        'BigfootsShipwrecks_Server\code\ExileServer_BigfootsShipwrecks_util_logCommand.sqf']
];

"PreInit finished" call ExileServer_BigfootsShipwrecks_util_logCommand;
