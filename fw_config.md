## GMB Hospital Satellite Internet - Firewal configuration checklist

# General, functional config
1. Change default admin password (This could also be done during setup wizard)
2. Upgrade Firewall (FW) firmware to the latest version (if applicable)
3. Run initial setup wizard

# Network segmentation
1. Create VLANs for the following departments and Add them to the main LAN Interface : 
   - OPD: OPD-VLAN 
   - Public Health Office: PHO-VLAN 
   - Pharmacy/eLMIS: PHARMACY-VLAN 
   - Admin: ADMIN-VLAN

2. Replace existing DNS with the following custom DNSs below:
   - Cloudflare: 1.1.1.1
   - W

3. Subnet the VLANs in the following network ranges: 
   - OPD-VLAN: 10.10.10.1
   - PHO-VLAN: 10.10.20.1
   - PHARMACY-VLAN: 10.10.30.1
   - ADMIN-VLAN: 10.10.40.1

# Network security & control measures
1. Configure traffic shaping and allocate minimal bandwidth per IP subnet
2. 