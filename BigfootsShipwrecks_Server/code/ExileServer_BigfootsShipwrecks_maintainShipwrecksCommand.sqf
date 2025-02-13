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
 *
 * Configurable Variables (Defined in config.sqf):
 * - BS_count_shipwrecks: Number of shipwrecks to track.
 * - BS_player_showCrateClaimMessageRadius: Distance at which a crate is detected.
 * - BS_player_showCrateClaimMessage: Enables/disables global notifications.
 */

if (!isServer) exitWith {};

// Define private variables
private["_coords", "_countWrecks", "_crateClaimMessageRadius", "_i", "_isPlayerInRange", "_markerId", "_markerPosition", "_message", "_showCrateClaimMessage"];

// Extract parameters passed into the function
_countWrecks = _this select 0;                    // Number of shipwrecks to track
_crateClaimMessageRadius = _this select 1;        // Radius in meters to check for players near a crate
_showCrateClaimMessage = _this select 2;          // Boolean: Show notification when a crate is found?

// Loop through all active shipwreck sites
for "_i" from 1 to BS_count_shipwrecks do
{
    // Get marker ID associated with the current wreck index
    _markerId = _i call ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery;

    // Ensure the marker exists before attempting to get its position
    if (markerExists _markerId) then 
    {
        _markerPosition = getMarkerPos _markerId;

        // Check if any player is within the specified radius of the wreck
        _isPlayerInRange = [_markerPosition, _crateClaimMessageRadius] call ExileClient_util_world_isAlivePlayerInRange;

        if (_isPlayerInRange) then 
        {
            // Log that the crate was found
            format["Crate found by Allies at [%1].", _markerPosition] call ExileServer_BigfootsShipwrecks_util_logCommand;

            // Remove the marker to indicate the crate has been recovered
            deleteMarker _markerId;

            // If enabled, notify all players that the crate has been found
            if (_showCrateClaimMessage) then 
            {
                _coords = mapGridPosition _markerPosition;
                _message = format ["Allies have recovered the crashed crate from coordinates %1.", _coords];

                // Send notification to clients
                ["Info", "Shipwreck loot found!", _message] call ExileServer_BigfootsShipwrecks_sendClientNotificationCommand;

                // Broadcast message to all players
                ["systemChatRequest", [_message]] call ExileServer_system_network_send_broadcast;
            };  
        };
    };
};
