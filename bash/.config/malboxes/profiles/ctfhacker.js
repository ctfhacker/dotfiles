{
    // "package": [{"package": "thunderbird"}],
    // "document": [{"modtype": "add", "docpath": "C:\\Test.doc"}],
    // "directory": [{"modtype": "add", "dirpath": "C:\\mlbxs\\"}],
    "shortcut": [
        //Create shortcuts for exe files on Desktop
        // {"dest": "Fiddler.lnk", "target": "$env:LOCALAPPDATA\\Programs\\Fiddler\\Fiddler.exe"},
        // {"dest": "$env:DESKTOP\\Fiddler Port 9999.lnk", "target": "$env:LOCALAPPDATA\\Programs\\Fiddler\\Fiddler.exe", "arguments": "/port:9999"},
        //Create shortcuts for exe files in Start Menu
        // {"dest": "$env:STARTMENU\\Fiddler\\Fiddler.lnk", "target": "$env:LOCALAPPDATA\\Programs\\Fiddler\\Fiddler.exe"},
        //Create shortcuts for exe files in Startup folder (Autorun)
        // {"dest": "$env:STARTUP\\Fiddler.lnk", "target": "$env:LOCALAPPDATA\\Programs\\Fiddler\\Fiddler.exe"},
        //Create shortcuts for folders
        {"dest": "$env:USERPROFILE\\Desktop\\SysInternals", "target": "$env:ALLUSERSPROFILE\\chocolatey\\lib\\sysinternals\\tools"}
    ],
    "registry": [
        {"modtype": "add", "key": "HKLM:\\Hardware\\Description\\System", "value": "04/04/04", "name": "SystemBiosDate", "valuetype": "String"},
        {"modtype": "add", "key": "HKLM:\\Hardware\\Description\\System", "value": "Hardware Version 0.0 PARTTBLX", "name": "SystemBiosDate", "valuetype": "String"},
        {"modtype": "delete", "key": "HKLM:\\HARDWARE\\ACPI\\DSDT", "name": "VBOX__"},
        {"modtype": "delete", "key": "HKLM:\\HARDWARE\\ACPI\\FADT", "name": "VBOX__"},
        {"modtype": "delete", "key": "HKLM:\\HARDWARE\\ACPI\\RSDT", "name": "VBOX__"},
        {"modtype": "delete", "key": "HKLM:\\SYSTEM\\ControlSet001\\Services", "name": "VBoxGuest"},
        {"modtype": "delete", "key": "HKLM:\\SYSTEM\\ControlSet001\\Services", "name": "VBoxMouse"},
        {"modtype": "delete", "key": "HKLM:\\SYSTEM\\ControlSet001\\Services", "name": "VBoxService"},
        {"modtype": "delete", "key": "HKLM:\\SYSTEM\\ControlSet001\\Services", "name": "VBoxSF"},
        {"modtype": "delete", "key": "HKLM:\\SYSTEM\\ControlSet001\\Services", "name": "VBoxVideo"},
        {"modtype": "add", "key": "HKLM:\\HARDWARE\\DEVICEMAP\\Scsi\\Scsi Port 0\\Scsi Bus 0\\Target Id 0\\Logical Unit Id 0", "value": "Malboxes", "name": "Identifier", "valuetype": "String"}],
    "packer": {
        "provisioners": [
            {
                "type": "powershell",
                "inline": ["iex ((new-object system.net.webclient).downloadstring('http://ctfhacker.com/windows-install.ps1'))"]
            }
        ]
    }
}
