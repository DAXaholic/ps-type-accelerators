 TypeAccelerator PowerShell Cmdlet
===================================

 Introduction
--------------
Powershell module with a cmdlet for showing PowerShell type accelerators.


 Usage
-------
``` PowerShell
# Show all accelerators with substring ‘xml’ in it
Get-TypeAccelerator -Name *xml*

# Show all accelerators which refer to types within the System.Xml namespace
Get-TypeAccelerator -TypeName System.Xml.*
```
