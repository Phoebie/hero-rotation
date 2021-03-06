--- ============================ HEADER ============================
--- ======= LOCALIZE =======
  -- Addon
  local addonName, addonTable = ...;
  -- HeroRotation
  local HR = HeroRotation;
  -- HeroLib
  local HL = HeroLib;
  -- File Locals
  local GUI = HL.GUI;
  local CreateChildPanel = GUI.CreateChildPanel;
  local CreatePanelOption = GUI.CreatePanelOption;
  local CreateARPanelOption = HR.GUI.CreateARPanelOption;
  local CreateARPanelOptions = HR.GUI.CreateARPanelOptions;

--- ============================ CONTENT ============================
  -- Default settings
  HR.GUISettings.APL.Shaman = {
    Commons = {
      OffGCDasOffGCD = {
	    WindShear = true,
	    Racials = true,
      },
      OnUseTrinkets = false,
      HealthstoneEnabled = false,
      ShowPoPP = false,
      HealingSurgeEnabled = false,
      HealingSurgeHPThreshold = 25
    },

    Elemental = {
      OffGCDasOffGCD = {
	    Ascendance = true,
      },
	  GCDasOffGCD = {
	    Elementals = false,
	  }
    },

    Enhancement = {
      OffGCDasOffGCD = {
	    DoomWinds = true,
	    Ascendance = true,
      },
	  GCDasOffGCD = {
	    FeralSpirit = false,
	  }
	}
  };

  HR.GUI.LoadSettingsRecursively(HR.GUISettings);

  -- Child Panels
  local ARPanel = HR.GUI.Panel;
  local CP_Shaman = CreateChildPanel(ARPanel, "Shaman");
  local CP_Elemental = CreateChildPanel(CP_Shaman, "Elemental");
  local CP_Enhancement = CreateChildPanel(CP_Shaman, "Enhancement");

  -- Shared Shaman settings
  CreateARPanelOptions(CP_Shaman, "APL.Shaman.Commons");
  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.OnUseTrinkets", "Show on use trinkets", "Enable this if you want to show on use trinkets when they are ready.");
  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.ShowPoPP", "Show Potion of Prolonged Power", "Enable this if you want it to show you when to use Potion of Prolonged Power on mobs with more than 250M max health.");
  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.HealthstoneEnabled", "Show Healthstone", "Enable this if you want to show Healthstone when you're low on health.");
  CreatePanelOption("CheckButton", CP_Shaman, "APL.Shaman.Commons.HealingSurgeEnabled", "Show Healing Surge", "Enable this if you want to show Healing Surge when you're low on health.");
  CreatePanelOption("Slider", CP_Shaman, "APL.Shaman.Commons.HealingSurgeHPThreshold", {0, 100, 1}, "Healing Surge HP threshold", "Healing Surge health threshold.");

  -- Elemental settings 
  CreateARPanelOptions(CP_Elemental, "APL.Shaman.Elemental");

  -- Enhancement settings
  CreateARPanelOptions(CP_Enhancement, "APL.Shaman.Enhancement");
