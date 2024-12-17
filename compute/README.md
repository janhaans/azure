# Azure Compute

- Virtual Machines
- App Services
- Azure Batch
- Azure Functions
- Container Instances
- Service Fabric
- Azure Kubernetes Service (AKS)

## Virtual Machines

Azure Virtual Machines (VMs) provide infrastructure as a service (IaaS) by allowing you to create and use virtual machines in the cloud.

Some of the benefits of VMs are:

- VMs allow you full access and control of the VM.
- Lower up-front cost compared to purchasing and maintaining hardware.
- Support of both Linux and Windows VMs.
- Multiple types to choose from, such as compute or memory-optimized VMs, along with varying amounts of CPU, RAM, and storage.
- VMs allow for the installation of custom images and are an excellent choice for migrating from an on-premises server to the cloud.
- Multiple VMs can be grouped to provide high availability, scalability, and redundancy. There are two options when it comes to scaling—Virtual Machine Scale Sets and Load Balancers. These will be covered in a different course.

Some of the limitations of VMs are:

- They are more expensive
- They can be more time-consuming for the developer than other compute options

## App Service

Azure App Service is an HTTP-based service for hosting web applications, REST APIs, and mobile backends. It is a Platform as a Service (PaaS) that allows a developer to focus on the application while Azure takes care of the infrastructure.

Some of the benefits of using an App Service are:

- Support of multiple languages, such as .NET, .NET Core, Java, Ruby, Node.js, PHP, or Python
- High availability, auto-scaling, and support of both Linux and Windows environments.
- Continuous deployment model using GitHub, Azure DevOps, or any Git repo.
- Vertical or Horizontal scaling. Vertical scaling increases or decreases resources allocated to our App Service, such as the amount of vCPUs or RAM, by changing the App Service pricing tier. Horizontal scaling increases or decreases the number of Virtual Machine instances our App Service is running.
- You can set the amount of hardware allocated to host your application, and the cost varies based on the plan you choose. There are three different tiers - Dev/Test, Production, and Isolated. We’ll be using the free option within Dev/Test for the exercises in this course.

Some of the limitations of an App Service are:

- You have limited access to the host server, so you are unable to control the underlying OS or install software on the server.
- You’re always paying for the service plan, even if your services or application isn’t running.
- There are hardware limitations, such as a maximum of 14GB of memory and 4 vCPU cores per instance
- While they support multiple languages, as noted in the benefits above, they are limited to just using those languages (as of when this course was built).

## Use Cases

Each of these has its own use cases, although sometimes there is still some ambiguity on when to use each. Virtual Machines are usually better when you need control of the underlying operating system or are using custom software to support your needs; an app service is typically better for lightweight applications and services, especially when you don't have the need for high-performance compute services. Additionally, you'll need to take into consideration the hardware limitations of App Services, as noted above.
