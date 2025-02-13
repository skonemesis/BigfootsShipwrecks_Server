/*
 * ExileServer_BigfootsShipwrecks_util_logCommand.sqf
 *
 * Utility function to log messages to the server RPT file.
 * Used for debugging and tracking key events.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM
 */

private["_message"];

_message = _this;

// Ensure the message is properly formatted before logging
if !(isNil "_message") then 
{
    diag_log format ["[Bigfoot's Shipwrecks] %1", _message];
};
