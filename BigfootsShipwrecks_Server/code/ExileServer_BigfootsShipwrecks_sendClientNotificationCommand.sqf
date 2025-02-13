/*
 * ExileServer_BigfootsShipwrecks_sendClientNotificationCommand.sqf
 *
 * Sends a notification message to the client via Exile's notification system.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM
 */

if (!isServer) exitWith {};

// Extract parameters passed into the function
private ["_messageType", "_title", "_message"];
_messageType = _this select 0;    // Notification type (e.g., "Info", "Warning", "Error")
_title = _this select 1;          // Notification title
_message = _this select 2;        // Notification body message

// Ensure the message is valid before sending
if (!isNil "_message" && { _message != "" }) then
{
    // Send notification to all players
    ["toastRequest", [_messageType, _title, _message]] call ExileServer_system_network_send_broadcast;
};
