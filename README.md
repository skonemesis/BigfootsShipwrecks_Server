## **Bigfoot's Shipwrecks - Server Addon**  

### **Changelog**  

#### **8/5/2016  v1.0.0** - Initial Release  
#### **2/13/2025 v2.0.0** - Major Overhaul (By sko & Ghost PGM DEV TEAM)  
- Standardized variable names across all scripts for consistency.  
- Refactored and cleaned up all scripts for better readability and maintainability.  
- Fixed multiple undefined variables to prevent runtime errors.  
- Ensured all function calls reference the correct `config.sqf` variables.  
- Updated and improved documentation & comments throughout the codebase.  
- Reorganized structure for easier navigation.  

---

### **Author:**  
- Original Author: **Bigfoot**  
- Modifications & Overhaul: **sko & Ghost PGM DEV TEAM**  

---

### **Description:**  

This addon spawns **shipwrecks with loot crates and markers** in random ocean locations on server restart.  
It does **NOT** spawn AI at the crates (yet), but AI can be manually added.  

**Key Gameplay Mechanics:**  
- Players **must transport crates to shore** using diving gear and transport vehicles.  
- **Inventory cannot be accessed underwater** due to Arma mechanics.  
- Compatible with **R3F Logistics, Igiload, and Exile crate mounting** for transport.  

Most settings can be configured in **config.sqf**.  

---

### **Features:**  
- **Configurable crate loot** (loot spawn percentages, guaranteed items, additional random items, poptab rewards).  
- **Dynamic wreck spawning** (random locations based on configurable center and distance parameters).  
- **Automatic marker system** (indicating wreck locations, disappearing when players are near).  
- **Configurable player notifications** (via chat and Exile toast messages).  
- **Logging system** (optional debug logs for crate contents and wreck spawns).  

---

### **Roadmap:**  
- Add optional **AI spawns** around crates.  
- Allow **shipwreck clustering** in specific regions (e.g., central bays, deep waters).  
- Introduce **rare loot mechanics** (increased chance for high-value items).  

---

### **License:**  

This work is licensed under the **Arma Public License Share Alike (APL-SA).**  
The full license text can be found in the `LICENSE.txt` file.  

**Key Points:**  
- You **cannot charge money** for this addon.  
- If you modify it, you must distribute it under the **same APL-SA license**.  
- Contributions are welcome—post improvements to **http://www.exilemod.com/**.  

---

### **Installation:**  

1. Download and place `BigfootsShipwrecks_Server.pbo` in:  
   `@ExileServer/addons/`  
2. Edit values in **config.sqf** to customize spawn settings, loot tables, and notifications.  
3. Restart your server.  

---

Let me know if you need any adjustments.
