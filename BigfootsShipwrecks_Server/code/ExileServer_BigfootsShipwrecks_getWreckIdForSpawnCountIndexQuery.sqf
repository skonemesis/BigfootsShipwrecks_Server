/*
 * ExileServer_BigfootsShipwrecks_getWreckIdForSpawnCountIndexQuery.sqf
 *
 * Generates a unique marker ID for each shipwreck spawn based on its index.
 * 
 * Updated by: sko & Ghost PGM DEV TEAM
 */

private["_wreckIndex"];

_wreckIndex = _this;
format ["BigfootsShipwrecks_wreck_%1", _wreckIndex];
