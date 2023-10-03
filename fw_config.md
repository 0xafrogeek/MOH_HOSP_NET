## GMB Hospital NET - Firewall configuration checklist

# General, functional config
   - [ ] Upgrade Firewall (FW) firmware to the latest version (if applicable)
   - [ ] Change default admin password (This could also be done during setup wizard)
   - [ ] Setup NTP server to a trusted and reliable ntp server
   - [ ] Run initial setup wizard if necessary

# Network segmentation
1. Create VLANs for the following departments and Add them to the main LAN Interface : 
   - [ ] OPD: OPD-VLAN 
   - [ ] Public Health Office: PHO-VLAN 
   - [ ] Pharmacy/eLMIS: PHARMACY-VLAN 
   - [ ] Post Natal: POSTNATAL-VLAN
   - [ ] RMNCAH: RMNCAH-VLAN

# Subnet per VLAN
2. Subnet the VLANs in the following network ranges: 
   - [ ] OPD-VLAN: 10.10.10.1
   - [ ] PHO-VLAN: 10.10.20.1
   - [ ] PHARMACY-VLAN: 10.10.30.1
   - [ ] RMNCAH-VLAN: 10.10.40.1

# DHCP Server
3. Configure FW as the DHCP Server and limit the IP allocation accordingly
   - [ ] Configure DHCP address ranges for all VLANs on FW

# Domain Name Server
4. Replace existing DNS with the following custom DNSs:
   - [ ] Cloudflare: 1.1.1.1
   - [ ] Quad9: 9.9.9.9

# Network security & control measures
5. Implement bandwidth control & basic traffic filtering
   - [ ] Configure traffic shaping and allocate minimal bandwidth per IP subnet
   - [ ] Install and configure pfblockerng for basic blocking of malious/unwanted traffic ([pfBlockerng Docs](https://www.comparitech.com/data-privacy-management/block-ads-malware-pfsense-pfblocker/))