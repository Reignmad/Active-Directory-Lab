# Active-Directory-Lab
Hands-on infrastructure projects demonstrating enterprise IT operations

# 🖥️ IT Infrastructure Home Lab Portfolio

**Author:** ReignMad  
**Goal:** Building hands-on enterprise infrastructure projects to transition from development into IT Operations / Junior Systems Administration.

---

## 📅 Project 1: Active Directory Home Lab

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

### 📌 Next Steps (Day 2)
- [ ] Complete Windows Server installation
- [ ] Set static IP address on the Domain Controller
- [ ] Install Active Directory Domain Services (AD DS)
- [ ] Promote server to Domain Controller (`corp.local`)

---
