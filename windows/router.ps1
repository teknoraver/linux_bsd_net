# Windows Server 2016 PowerShell

New-NetIPAddress -InterfaceAlias 'Ethernet 2' -IPAddress 16.1.0.1 -PrefixLength 8
New-NetIPAddress -InterfaceAlias 'Ethernet 3' -IPAddress 20.1.0.1 -PrefixLength 8
New-NetRoute -DestinationPrefix 48.0.0.0/8 -InterfaceAlias 'Ethernet 3' -NextHop 20.1.0.2
New-NetNeighbor -IPAddress 20.1.0.2 -LinkLayerAddress 24:6e:96:63:81:aa -InterfaceAlias 'Ethernet 3' -State Permanent
Set-NetIPInterface -InterfaceAlias 'Ethernet 2' -Forwarding Enabled
Set-NetAdapterAdvancedProperty -InterfaceAlias 'Ethernet 2' -RegistryKeyword '*FlowControl' -RegistryValue 0
Set-NetAdapterAdvancedProperty -InterfaceAlias 'Ethernet 3' -RegistryKeyword '*FlowControl' -RegistryValue 0
