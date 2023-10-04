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
    - [ ] Add the various VLANs as on the FW (with descriptions)
    - [ ] Assign the VLANs the same IP subnet as on the FW
    - [ ] Configure a new VLAN for MANAGEMENT - (native)
    - [ ] Native VLAN should be a trunk port and should be assigned 

# Access & Trunk Ports
2. Configure Trunk Ports on all ports that will be connecting the Access points
    - [ ] Configure enough Trunk ports to match the number of Access Points
    - [ ] Allow the respective VLANs to pass through the relevant Trunk Ports
    - [ ] Configure the rest of the ports as Access Ports
    - [ ] Assign Access Ports to their respective VLANs

# Security & Control measures
3. Disable unsecure services and implement basic, relevant security measures to hardening the security of the switch
    - [ ] Disable telnet
    - [ ] Disbale http
    - [ ] Disable CDP and LLDP
    - [ ] Configure/enable DHCP Snooping
    - [ ] Configure Dynamic ARP Inspection (DAI)
    - [ ] Shutdown all unused ports after configuration