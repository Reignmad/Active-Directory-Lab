# Active-Directory-Lab
Hands-on infrastructure projects demonstrating enterprise IT operations

# 🖥️ IT Infrastructure Home Lab Portfolio

**Author:** ReignMad  
**Goal:** Building hands-on enterprise infrastructure projects to transition from development into IT Operations / Junior Systems Administration.

---

## 📅 Active Directory Home Lab

### Status: 🟢 IN PROGRESS (Day 1 - Setup Phase)

**Objective:**  
Build a fully functional corporate network using free virtualization software. This simulates the exact environment I will manage in a real infrastructure job—domain controllers, user accounts, group policies, and networked workstations.

---

### 📝 Progress Log

#### Day 1 (Current Date): Initial Setup
- ✅ Downloaded Oracle VirtualBox 7.x
- ✅ Downloaded Windows Server 2022 Evaluation ISO (`SERVER_EVAL_x64FRE_en-us`)
- ✅ Downloaded Windows 10/11 ISO
- ✅ Created VirtualBox VM (Name: `DC-Server`)
- ✅ Allocated 4GB RAM, 2 CPU cores, 50GB storage
- ✅ Configured Unattended Installation (Username: Admin, Password: ********)
- 🔄 Currently installing Windows Server 2022 on the VM

---

### 📸 Screenshots

*<img width="1602" height="780" alt="image" src="https://github.com/user-attachments/assets/0d679809-ff17-46ea-a94a-10f2b305d4f0" />*

> ![VirtualBox Manager - Day 1](screenshots/day1-virtualbox-manager.png)

---

### 🛠️ Tools Used
| Tool | Purpose |
|------|---------|
| Oracle VirtualBox | Virtualization platform |
| Windows Server 2022 Eval | Domain Controller OS |
| Windows 10/11 Pro | Client Workstation OS |
| PowerShell | Automation scripting |

---

This repository is my proof of work. Instead of just listing "Active Directory" on my CV, I built an entire enterprise environment from scratch, automated 1,000 users, and documented every step. 

**NOTE:** This is not a tutorial. This is real, executable infrastructure code that I designed, deployed, and troubleshooted myself.

---

##**DAY 2**
## ✅ Project: Active Directory Domain Services (AD DS) – COMPLETED

**Domain:** `oabusa.local`  
**Controller IP:** `192.168.10.10`  
**Client OS:** Windows 10 (Domain-Joined)

### 🎯 Business Objective
Simulate a real corporate IT environment to prove I can:
- Deploy and configure a Domain Controller.
- Structure a company's internal IT hierarchy using Organizational Units (OUs).
- Automate large-scale onboarding using PowerShell.
- Troubleshoot real-world login and authentication issues.

### 🛠️ Technical Implementation

| Phase | Implementation Detail |
| :--- | :--- |
| **Virtualization** | Deployed Windows Server 2022 and Windows 10 on Oracle VirtualBox using Internal Networking. |
| **Core Infrastructure** | Configured static IP addressing and DNS forwarding; installed Active Directory Domain Services (AD DS). |
| **Corporate Structure** | Created 6 Organizational Units (OUs): **IT, HR, Finance, Sales, Marketing, Operations**. |
| **Automation (The "Golden Ticket")** | Wrote a PowerShell script to generate **1,000 unique users** with random names, job titles, and phone numbers—populating the OUs instantly. |
| **Client Validation** | Joined a Windows 10 workstation to the domain and validated secure login functionality. |
| **Bulk Maintenance** | Executed a secondary PowerShell script to reset passwords for all 995 active users, ensuring 100% login success rate. |

---

### 📸 Visual Proof (Screenshots)

| Step | Screenshot |
| :--- | :--- |
| **Server Installation** | <img width="2880" height="1346" alt="After installing" src="https://github.com/user-attachments/assets/aa368439-28e2-470e-b032-a12d7f3ac667" />|
| **Network Config (Static IP)** | <img width="1026" height="766" alt="checking networking config on cmd" src="https://github.com/user-attachments/assets/0fc3892e-3fe9-4520-b72d-53a326d2eff7" />|
| **OUs Created** | <img width="1024" height="762" alt="OUs created" src="https://github.com/user-attachments/assets/6d398900-53e4-4a00-b579-95a8e42a8622" />|
| **PowerShell User Creation (1,000 users)** | <img width="1024" height="766" alt="users created in the vm AD" src="https://github.com/user-attachments/assets/17e29a46-6f66-4a50-b5af-513daa496588"/>|
| **Active Directory User List** | <img width="1022" height="778" alt="Created user in the OUs" src="https://github.com/user-attachments/assets/263424bf-d5f9-443c-b8d3-2aa8bfc5649a" />|
| **Pre-Windows 2000 Login Names** | (samaccountname for login on new vm.png) |
| **Win10 Joined to Domain** | <img width="1018" height="766" alt="internal network new vm connected to DC" src="https://github.com/user-attachments/assets/5b38c90d-88c7-4738-be7a-2795d92738df" />|
| **Successful Domain Login** | <img width="1014" height="922" alt="evidence that i can log in into users on the AD" src="https://github.com/user-attachments/assets/0502ce35-5d25-4f1c-a8ca-3362ec7a0a06" />|
| **Bulk Password Reset (995 users)** | <img width="1022" height="878" alt="reseting password of users cause of error of sign in on new vn" src="https://github.com/user-attachments/assets/5d486918-6beb-4d45-9df2-aa5c07ed8cae" />|

---

### 📜 Key Automation Scripts

#### 1. Bulk User Provisioning (`CreateUsers.ps1`)
This script solves the problem of manual data entry. It dynamically creates 1,000 users and places them into the correct departmental OUs.

```powershell
Import-Module ActiveDirectory
# Arrays for generating realistic random data...
$FirstNames = @("James","Mary","John","Patricia",...)
$LastNames = @("Smith","Johnson","Williams",...)
$OUs = @("IT","HR","Finance","Sales","Marketing","Operations")

for ($i=1; $i -le 1000; $i++) {
    # (Full script available in the repository /scripts folder)
}

---
