## GMB Hospital NET - Switch (SW) configuration checklist

# General, functional config
    - [ ] Upgrade switch firmware
    - [ ] Set SW hostname
    - [ ] Increment console timeout
    - [ ] Set banner message
    - [ ] Configure NTP Server - Should point to FW
    - [ ] Disable DNS resolution (domain lookup)
    - [ ] Disable smart port feature
    - [ ] Configure SSH access for management
    - [ ] Increment console and SSH time-out

# VLAN Config
([Cisco VLAN Config Docs](https://www.cisco.com/c/en/us/td/docs/switches/lan/catalyst_pon/software/configuration_guide/vlan/b-gpon-config-vlan/configuring_vlan.pdf))
1. Implement network segmentation via VLANs for the various hospital departments
    - [ ] Add the various VLANs as on the FW using the same PVID (descriptions will be helpful)
    - [ ] Assign the VLANs the same IP subnet as on the FW
    - [ ] Configure a new VLAN for MANAGEMENT - (native)
    - [ ] Native VLAN should be a trunk port and should be assigned a static IP for management purposes

# Access & Trunk Ports
2. Configure Trunk Ports on all ports that will be connecting the Access points
    - [ ] Configure the SW port connected to the FW as trunk and tag relevant VLANS
    - [ ] Configure enough Trunk ports to match the number of Access Points - All our Cisco APs should be connected to Trunk ports, as VLANs will be implemented on them as well
    - [ ] Configure the rest of the ports as Access Ports
    - [ ] Assign Access Ports to their respective VLANs

# Security & Control measures
3. Disable unsecure services and implement basic, relevant security measures to hardening the security of the switch
    - [ ] Enable console secret
    - [ ] Enable priv exec secret
    - [ ] Disable telnet
    - [ ] Disbale http
    - [ ] Disable CDP and LLDP
    - [ ] Configure/enable DHCP Snooping
    - [ ] Configure Dynamic ARP Inspection (DAI)
    - [ ] Shutdown all unused ports after configuration