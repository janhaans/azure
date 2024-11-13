# Virtual Machines

## Overview

- Cannot change VM name
- Cannot change VNET
- VM can be resized (scale-up, scale-down)
- You can select whether the OS disk, public IP, NIC should be or should not be deleted when the VM is deleted.

![vm architecture](vm-architecture.png)

## VM Cost Models

### Pay-as-you-go

When the VM is shutdown and deallocated, then

- No cost for the VM, however you are still paying for associated resources such as storage and public IP.
- VM still counts to the subscription resource limits

## VM Family

- General Purpose
- Compute Optimized
- Memory Optimized
- Storage Optimized
- High Performance Compute
- GPU

## Storage

![storage](storage.png)

**OS Disk**

- Can use Image from the Marketplace or Custom Images
- Can be resized but thsi requires downtime (stop/deallocate VM)
