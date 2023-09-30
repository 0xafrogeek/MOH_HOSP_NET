en
conf t

hostname MOH-HOSP-CORESW
line console 0
password GMBHPNT@2023
login
exit


!-- Management IP Address
int vlan 199
ip address 10.10.0.199 255.255.255.0
ip default-gateway 10.10.0.1
no shutdown
exit


!-- Add decriptions to interfaces
int F0/1
decriptions link to int to gateway


no ip domain-lookup
banner motd #Ministry of Health Internal Networks - No Unauthorized Access!!!#
enable password GMBHPNT@2023
service password-encryption

do wr

!-- SSH
ip domain name moh.gm 
username mohcore password GMBHPNT@2023*
crypto key generate rsa
2048
line vty 0 15 # #of virtual lines to allocate for remote SSH or TELNET sessions
transport input ssh
login local
exit
ip ssh version 2
do wr

exit

!-- Security --!
!---------------

!-- Make sure our switch firmware is up-to-date

!-- Configure switch to use firewall as ntp server
clock timzone UTC +0 # Timezone for GMB
ntp server 10.10.10.253


!-- Configure SSH
ip domain name moh.gm 
username mohcore password GMBHPNT@2023
crypto key generate rsa
2048
line vty 0 15
login local
transport input ssh # Disable telnet and enable SSH
ip ssh version 2
do wr

!-- Disable CDP
no cdp run

!-- disable http
no ip http server



!-- Configure DHCP Snooping
ip dhcp snooping
ip dhcp snooping vlan 120
int gig1/0/1
ip dhcp snooping trust

!-- Configure DAI (Dynamic ARP Inspection)
!-- DHCP Snooping must be enabled before DAI can work
int gig1/0/1
ip arp inspection trust
ip arp inspection vlan 120 !-- Enabled at the vlan level

!-- Configure port security
int range fa0/3-24
switchport port-security
switchport port-security maximum 1
switchport port-security mac-address sticky
switchport port-security violation shutdown

!-- Limit SSH access to admin IP only
access-list 1 permit host <10.10.10.234>
line vty 0 15
login
password GMBHPNT@2023
access-class 1 in

!----- !

!-- Logs
show logs

!-- Troubleshooting L1/L3 issues - Check status of interfaces
!-- 'administratively down' - L2 issue - Put it up with 'no shutdown'
!-- 'down/down' - L1 issue - Check cables and connections
!-- 'up/down' - L2 issue or speed mismatch - Check int conf matches on both sides of the link, especially with vlan ints



!-- SG250-50 Default IP: 192.168.1.254


!-- Configure vlans on OPD and other switches
int range fa0/1-2
switchport mode trunk
exit

vlan 160
name SERVER-ROOM-VLAN
vlan 99
name BlackHole
exit

int range fa0/3-24
switchport mode access
switchport access vlan 120
exit

int range gig0/1-2
switchport mode access
switchport access vlan 99
exit

do wr

!-- Port security for LAB
int range fa0/3-24
switchport port-security
!-- Allow a maximum of 1 mac address
switchport port-security maximum 1
!-- Sticky mode - auto detect and attach the first connected mac address
switchport port-security mac-address sticky
!-- Shut port down if violated - More than one mac connected
switchport port-security violation shutdown


!-- Configure L3 SW trunk interfaces
int gig1/0/3-8
switchport mode trunk

vlan 110
name OPD-VLAN
vlan 120
name LAB-VLAN
vlan 130
name CRVS-VLAN
vlan 140
name ADMIN-VLAN
vlan 150
name ICT-VLAN
vlan 160
name SERVER-ROOM-VLAN

exit

do wr

!-- Configure switch for AP access
vlan 20
name Corporate
vlan 21
name Guest

int gig1/0/1
switchport mode trunk
switchport trunk allowed vlan 20,21

!-- L3 Switch ports are access ports by default, we must make 1 or 2 ports L3 ports inorder to use them as link ports and assign them IPs
int range gig1/0/1-2
no switchport

exit
do wr

!--
ssh -l <username> <SW-IP>

255.255.255.128/25
128 - 255 
/28 = 255.255.255.240 -> 255 - 240 = 15  -> 240-128=112-64=48-32=16-16=0 -> 4 bits -> 11111111.11111111.11111111.11110000

!-- Cloudflare DNS: 1.1.1 1.0.0.1

!-- Increase the vty lines/console session timeout
line con 0 # For console
exec-timeout 60 # 60 mins
line vty 0 15 # For SSH
exec-timeout 5 30


#############################################

