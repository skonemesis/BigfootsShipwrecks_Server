/*
 * Bigfoot's Shipwrecks - Server Configuration
 * Updated by: sko & Ghost PGM DEV TEAM
 * 
 * This file defines the required dependencies and initializes key functions for the Shipwreck spawner.
 */

class CfgPatches
{
    class BigfootsShipwrecks_Server
    {
        requiredVersion = 0.1;
        requiredAddons[] = {"exile_server"}; // Ensure the mod loads after Exile Server
        units[] = {};
        weapons[] = {};
    };
};

class CfgFunctions 
{
    class BigfootsShipwrecks_Server 
    {
        class main 
        {            
            file = "BigfootsShipwrecks_Server\bootstrap";
            class preInit
            {
                preInit = 1; // Function runs before mission starts
            };
            class postInit
            {
                postInit = 1; // Function runs after mission starts
            };
        };
    };
};

/*
 * This file is subject to the terms and conditions defined in
 * file 'APL-SA LICENSE.txt', which is part of this source code package.

 
class CfgPatches
{
	class BigfootsShipwrecks_Server {
		requiredVersion = 0.1;
		requiredAddons[] = {
            "exile_server"
        };
		units[] = {};
		weapons[] = {};
	};
};

class CfgFunctions 
{
	class BigfootsShipwrecks_Server 
	{
		class main 
		{			
			file="BigfootsShipwrecks_Server\bootstrap";
			class preInit
            {
                preInit = 1;
            };
			class postInit
			{
				postInit = 1;
			};
		};
	};
};
*/
