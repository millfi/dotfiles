{ ... }:

{
  xdg.configFile."plasma-org.kde.plasma.desktop-appletsrc" = {
    force = true;
    text = ''
    [ActionPlugins][0]
    RightButton;NoModifier=org.kde.contextmenu

    [ActionPlugins][1]
    RightButton;NoModifier=org.kde.contextmenu

    [Containments][1]
    ItemGeometries-1969x1108=
    ItemGeometriesHorizontal=
    activityId=e8a83731-4ea9-4532-84aa-e5862d5b4557
    formfactor=0
    immutability=1
    lastScreen=0
    location=0
    plugin=org.kde.plasma.folder
    wallpaperplugin=org.kde.image

    [Containments][119]
    activityId=
    formfactor=2
    immutability=1
    lastScreen=0
    location=3
    plugin=org.kde.panel
    wallpaperplugin=org.kde.image

    [Containments][119][Applets][120]
    immutability=1
    plugin=org.kde.plasma.appmenu

    [Containments][119][Applets][121]
    activityId=
    formfactor=0
    immutability=1
    lastScreen=-1
    location=0
    plugin=org.kde.plasma.systemtray
    popupHeight=432
    popupWidth=432
    wallpaperplugin=org.kde.image

    [Containments][119][Applets][121][Applets][122]
    immutability=1
    plugin=org.kde.plasma.clipboard

    [Containments][119][Applets][121][Applets][123]
    immutability=1
    plugin=org.kde.plasma.manage-inputmethod

    [Containments][119][Applets][121][Applets][124]
    immutability=1
    plugin=org.kde.plasma.cameraindicator

    [Containments][119][Applets][121][Applets][125]
    immutability=1
    plugin=org.kde.plasma.keyboardlayout

    [Containments][119][Applets][121][Applets][126]
    immutability=1
    plugin=org.kde.plasma.devicenotifier

    [Containments][119][Applets][121][Applets][127]
    immutability=1
    plugin=org.kde.plasma.notifications

    [Containments][119][Applets][121][Applets][128]
    immutability=1
    plugin=org.kde.plasma.weather

    [Containments][119][Applets][121][Applets][129]
    immutability=1
    plugin=org.kde.plasma.printmanager

    [Containments][119][Applets][121][Applets][130]
    immutability=1
    plugin=org.kde.kscreen

    [Containments][119][Applets][121][Applets][131]
    immutability=1
    plugin=org.kde.plasma.keyboardindicator

    [Containments][119][Applets][121][Applets][132]
    immutability=1
    plugin=org.kde.plasma.volume

    [Containments][119][Applets][121][Applets][132][Configuration][General]
    migrated=true

    [Containments][119][Applets][121][Applets][133]
    immutability=1
    plugin=org.kde.plasma.networkmanagement

    [Containments][119][Applets][121][Applets][134]
    immutability=1
    plugin=org.kde.plasma.battery

    [Containments][119][Applets][121][Applets][135]
    immutability=1
    plugin=org.kde.plasma.brightness

    [Containments][119][Applets][121][Applets][136]
    immutability=1
    plugin=org.kde.plasma.mediacontroller

    [Containments][119][Applets][121][General]
    extraItems=org.kde.plasma.clipboard,org.kde.plasma.manage-inputmethod,org.kde.plasma.cameraindicator,org.kde.plasma.keyboardlayout,org.kde.plasma.devicenotifier,org.kde.plasma.mediacontroller,org.kde.plasma.notifications,org.kde.plasma.battery,org.kde.plasma.weather,org.kde.plasma.printmanager,org.kde.kscreen,org.kde.plasma.keyboardindicator,org.kde.plasma.volume,org.kde.plasma.networkmanagement,org.kde.plasma.brightness
    knownItems=org.kde.plasma.clipboard,org.kde.plasma.manage-inputmethod,org.kde.plasma.cameraindicator,org.kde.plasma.keyboardlayout,org.kde.plasma.devicenotifier,org.kde.plasma.mediacontroller,org.kde.plasma.notifications,org.kde.plasma.battery,org.kde.plasma.weather,org.kde.plasma.printmanager,org.kde.kscreen,org.kde.plasma.keyboardindicator,org.kde.plasma.volume,org.kde.plasma.networkmanagement,org.kde.plasma.brightness

    [Containments][119][Applets][137]
    immutability=1
    plugin=org.kde.plasma.panelspacer

    [Containments][119][General]
    AppletOrder=120;137;121

    [Containments][2]
    activityId=
    formfactor=3
    immutability=1
    lastScreen=0
    location=5
    plugin=org.kde.panel
    wallpaperplugin=org.kde.image

    [Containments][2][Applets][138]
    immutability=1
    plugin=org.kde.plasma.kickoff

    [Containments][2][Applets][138][Configuration]
    popupHeight=400
    popupWidth=560

    [Containments][2][Applets][138][Configuration][General]
    favoritesPortedToKAstats=true

    [Containments][2][Applets][21]
    immutability=1
    plugin=org.kde.plasma.digitalclock

    [Containments][2][Applets][21][Configuration]
    popupHeight=720
    popupWidth=560

    [Containments][2][Applets][21][Configuration][Appearance]
    fontWeight=400

    [Containments][2][Applets][22]
    immutability=1
    plugin=org.kde.plasma.showdesktop

    [Containments][2][Applets][5]
    immutability=1
    plugin=org.kde.plasma.icontasks

    [Containments][2][Applets][5][Configuration][ConfigDialog]
    DialogHeight=630
    DialogWidth=810

    [Containments][2][Applets][5][Configuration][General]
    launchers=applications:systemsettings.desktop,preferred://filemanager,preferred://browser,applications:microsoft-edge.desktop,applications:org.kde.konsole.desktop,applications:org.kde.kwrite.desktop
    maxStripes=2

    [Containments][2][Applets][6]
    immutability=1
    plugin=org.kde.plasma.marginsseparator

    [Containments][2][Applets][65]
    immutability=1
    plugin=org.kde.plasma.activitypager

    [Containments][2][Applets][65][Configuration][ConfigDialog]
    DialogHeight=630
    DialogWidth=810

    [Containments][2][Applets][7]
    immutability=1
    plugin=org.kde.plasma.kimpanel

    [Containments][2][General]
    AppletOrder=65;138;5;6;7;21;22

    [ScreenMapping]
    itemsOnDisabledScreens=
    screenMapping=
    '';
  };

  xdg.configFile."plasmashellrc" = {
    force = true;
    text = ''
    [PlasmaTransientsConfig]
    PreloadWeight=0
    popupHeight=432
    popupWidth=432

    [PlasmaViews][Panel 119]
    floating=0
    panelLengthMode=0
    panelOpacity=2
    panelVisibility=0

    [PlasmaViews][Panel 119][Defaults]
    thickness=27

    [PlasmaViews][Panel 2]
    floating=0
    floatingApplets=0
    panelOpacity=2
    panelVisibility=0

    [PlasmaViews][Panel 2][Defaults]
    thickness=44

    [Updates]
    performed=/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/keyboardlayout_migrateiconsetting.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/systemloadviewer_systemmonitor.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/digitalclock_migrate_showseconds_setting.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/klipper_clear_config.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/move_desktop_layout_config.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/folderview_fix_recursive_screenmapping.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/containmentactions_middlebutton.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/unlock_widgets.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/digitalclock_rename_timezonedisplay_key.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/digitalclock_migrate_font_settings.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/maintain_existing_desktop_icon_sizes.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/migrate_font_weights.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/taskmanager_configUpdate_wheelEnabled.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/keyboardlayout_remove_shortcut.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/mediaframe_migrate_useBackground_setting.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/no_middle_click_paste_on_panels.js
    '';
  };

  xdg.configFile."kwinrc".text = ''
    [Desktops]
    Id_1=de76fa02-ad89-4e95-b77e-d521a9522dd1
    Number=1
    Rows=1

    [Tiling]
    padding=4

    [Tiling][de76fa02-ad89-4e95-b77e-d521a9522dd1][4cd79926-6493-487f-b895-b49accb6c791]
    tiles={"layoutDirection":"horizontal","tiles":[{"width":0.25},{"width":0.5},{"width":0.25}]}

    [Wayland]
    InputMethod[$e]=/run/current-system/sw/share/applications/org.fcitx.Fcitx5.desktop

    [Xwayland]
    Scale=1.3
  '';

  xdg.configFile."kdeglobals".text = ''
    [ColorEffects:Disabled]
    ChangeSelectionColor=
    Color=56,56,56
    ColorAmount=0
    ColorEffect=0
    ContrastAmount=0.65
    ContrastEffect=1
    Enable=
    IntensityAmount=0.1
    IntensityEffect=2

    [ColorEffects:Inactive]
    ChangeSelectionColor=true
    Color=112,111,110
    ColorAmount=0.025
    ColorEffect=2
    ContrastAmount=0.1
    ContrastEffect=2
    Enable=false
    IntensityAmount=0
    IntensityEffect=0

    [Colors:Button]
    BackgroundAlternate=163,212,250
    BackgroundNormal=252,252,252
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=61,174,233
    ForegroundInactive=112,125,138
    ForegroundLink=41,128,185
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=35,38,41
    ForegroundPositive=39,174,96
    ForegroundVisited=155,89,182

    [Colors:Complementary]
    BackgroundAlternate=27,30,32
    BackgroundNormal=42,46,50
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=61,174,233
    ForegroundInactive=161,169,177
    ForegroundLink=29,153,243
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=252,252,252
    ForegroundPositive=39,174,96
    ForegroundVisited=155,89,182

    [Colors:Header]
    BackgroundAlternate=239,240,241
    BackgroundNormal=222,224,226
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=61,174,233
    ForegroundInactive=112,125,138
    ForegroundLink=41,128,185
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=35,38,41
    ForegroundPositive=39,174,96
    ForegroundVisited=155,89,182

    [Colors:Header][Inactive]
    BackgroundAlternate=227,229,231
    BackgroundNormal=239,240,241
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=61,174,233
    ForegroundInactive=112,125,138
    ForegroundLink=41,128,185
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=35,38,41
    ForegroundPositive=39,174,96
    ForegroundVisited=155,89,182

    [Colors:Selection]
    BackgroundAlternate=163,212,250
    BackgroundNormal=61,174,233
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=255,255,255
    ForegroundInactive=112,125,138
    ForegroundLink=253,188,75
    ForegroundNegative=176,55,69
    ForegroundNeutral=198,92,0
    ForegroundNormal=255,255,255
    ForegroundPositive=23,104,57
    ForegroundVisited=155,89,182

    [Colors:Tooltip]
    BackgroundAlternate=239,240,241
    BackgroundNormal=247,247,247
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=61,174,233
    ForegroundInactive=112,125,138
    ForegroundLink=41,128,185
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=35,38,41
    ForegroundPositive=39,174,96
    ForegroundVisited=155,89,182

    [Colors:View]
    BackgroundAlternate=247,247,247
    BackgroundNormal=255,255,255
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=61,174,233
    ForegroundInactive=112,125,138
    ForegroundLink=41,128,185
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=35,38,41
    ForegroundPositive=39,174,96
    ForegroundVisited=155,89,182

    [Colors:Window]
    BackgroundAlternate=227,229,231
    BackgroundNormal=239,240,241
    DecorationFocus=61,174,233
    DecorationHover=61,174,233
    ForegroundActive=61,174,233
    ForegroundInactive=112,125,138
    ForegroundLink=41,128,185
    ForegroundNegative=218,68,83
    ForegroundNeutral=246,116,0
    ForegroundNormal=35,38,41
    ForegroundPositive=39,174,96
    ForegroundVisited=155,89,182

    [General]
    ColorSchemeHash=2c3f86428c11011a7c64ee1e7f47c274d498ff10

    [KDE]
    AutomaticLookAndFeel=true
    ShowDeleteCommand=false

    [KFileDialog Settings]
    Allow Expansion=false
    Automatically select filename extension=true
    Breadcrumb Navigation=false
    Decoration position=0
    Show Full Path=false
    Show Inline Previews=false
    Show Preview=false
    Show Speedbar=true
    Show hidden files=false
    Sort by=Name
    Sort directories first=true
    Sort hidden files last=false
    Sort reversed=false
    Speedbar Width=166
    View Style=Simple

    [PreviewSettings]
    EnableRemoteFolderThumbnail=false
    MaximumRemoteSize=0

    [WM]
    activeBackground=227,229,231
    activeBlend=227,229,231
    activeForeground=35,38,41
    inactiveBackground=239,240,241
    inactiveBlend=239,240,241
    inactiveForeground=112,125,138
  '';

  xdg.configFile."plasma-localerc".text = ''
    [Formats]
    LANG=ja_JP.UTF-8
  '';
}
