## GMB Hospital NET - Firewall configuration checklist

# Vars
- DNS: 1.1.1.1, 9.9.9.9
- Hostname naming convention: e.g mohnet-fw-bmch.moh.gm
- VLANS IDs: OPD=110, PHO=120, POSTNATAL=130, SERVER-ROOM=140, PHARMACY=150

# General, functional config
   - [ ] Launch the initial setup wizard - set hostname, dns, ntp server
   - [ ] Update FW firmware

# Network segmentation
1. Create VLANs for the following departments and Add them to a dedicated LAN Interface like <opt7>: 
   - [ ] OPD: OPD-VLAN 
   - [ ] Public Health Office: PHO-VLAN 
   - [ ] Post Natal: POSTNATAL-VLAN
   - [ ] IT/Server: IT-VLAN
   - [ ] Pharmacy/eLMIS: PHARMACY-VLAN 

# Subnet per VLAN
2. Subnet the VLANs in the following network ranges: 
   - [ ] OPD-VLAN: 10.10.10.1
   - [ ] PHO-VLAN: 10.10.20.1
   - [ ] POSTNATAL-VLAN: 10.10.30.1
   - [ ] IT-VLAN: 10.10.40.1
   - [ ] PHARMACY-VLAN: 10.10.50.1

# DHCP Server
3. Configure FW as the DHCP Server and limit the IP allocation accordingly
   - [ ] Configure DHCP address ranges for all VLANs on FW - [Services > DHCP Server > <VLAN-NAME>]
      - Ensure a limited number of IPs are allocated per VLAN, not exceeding the number of staff per shift, per department
   
# Network security & control measures
4. Implement bandwidth control & basic traffic filtering
   - [ ] Configure traffic shaping and allocate minimal bandwidth per IP subnet
   - [ ] Install and configure pfblockerng package for basic blocking of malicious/unwanted traffic ([pfBlockerng Docs](https://www.comparitech.com/data-privacy-management/block-ads-malware-pfsense-pfblocker/))


