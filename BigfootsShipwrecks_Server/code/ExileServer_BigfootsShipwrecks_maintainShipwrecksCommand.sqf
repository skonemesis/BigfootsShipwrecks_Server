/*
 * Bigfoot's Shipwrecks - Maintain Shipwreck Events
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This script continuously checks for player proximity to shipwreck crates.
 * If a player enters the defined range, the wreck's marker is removed and a
 * notification is sent to all players.
 *
 * Key Features:
 * - Monitors active shipwreck locations.
 * - Removes markers when players approach the crate.
 * - Sends global notifications when a crate is found.
 * - Standardized variable naming to match BS_count_shipwrecks from config.sqf
 * - Ensured marker existence check before retrieving position
 * - Added structured comments for clarity
 * - 
 *
 * Configurable Variables (Defined in config.sqf):
 * - BS_count_shipwrecks: Number of shipwrecks to track
 * - BS_player_showCrateClaimMessageRadius: Distance at which a crate is detected
 * - BS_player_showCrateClaimMessage: Enables/disables global notifications
 * - Improved logging to help track crate recoveries
 */

if (!isServer) exitWith {};

// Define private variables
private ["_countShipwrecks", "_crateClaimMessageRadius", "_showCrateClaimMessage", "_markerId", "_markerPosition", "_isPlayerInRange", "_coords", "_message"];

// Extract parameters
_countShipwrecks = _this select 0;             // Number of active shipwrecks
_crateClaimMessageRadius = _this select 1;     // Radius to check for players
_showCrateClaimMessage = _this select 2;       // Enable/disable global messages

// Loop through all active shipwrecks
for "_i" from 1 to BS_count_shipwrecks do
{
    // Get marker ID for this wreck
    _markerId = _i call ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery;

    // Ensure marker exists before proceeding
    if (markerExists _markerId) then 
    {
        _markerPosition = getMarkerPos _markerId;

        // Check if a player is within the defined radius
        _isPlayerInRange = [_markerPosition, _crateClaimMessageRadius] call ExileClient_util_world_isAlivePlayerInRange;

        if (_isPlayerInRange) then 
        {
            // Log the event
            format ["Shipwreck crate found by player at [%1].", _markerPosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

            // Remove the marker to indicate the crate has been recovered
            deleteMarker _markerId;

            // If enabled, notify all players
            if (_showCrateClaimMessage) then 
            {
                _coords = mapGridPosition _markerPosition;
                _message = format ["Allies have recovered the shipwreck crate at coordinates %1.", _coords];

                // Send notification to clients
                ["Info", "Shipwreck Loot Found!", _message] call ExileServer_BigfootsShipwrecks_sendClientNotificationCommand;

                // Broadcast message to all players
                ["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
            };
        };
    };
};
