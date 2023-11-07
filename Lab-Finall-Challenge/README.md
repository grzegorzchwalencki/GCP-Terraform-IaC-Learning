# Challange Objectives

In this lab, I had to perform the following tasks:

* Import existing infrastructure into your Terraform configuration.
* Build and reference your own Terraform modules.
* Add a remote backend to your configuration.
* Use and implement a module from the Terraform Registry.
* Re-provision, destroy, and update infrastructure.
* Test connectivity between the resources you've created.

## Tasks

* Task 1. Create the configuration files
    - Directory structure created
    - Variables added
    - Terraform block and specified provider added

* Task 2. Import infrastructure
    - References to instances module added
    - Resoruce configurations to existing intances added
    - Import resoruce configurations to instances module - done

            terraform import module.instances.google_compute_instance.tf-instance-1 project-ID/zone/resoruce-ID
* Task 3. Configure a remote backend
    - Storage Bucket Resorce added in storage module
    - References to storage module added
    - Storage bucket as remote backed configurated

* Task 4. Modify and update infrastructure
    - Modified instances resoruces 
    - New instance resource "tf-instance-new" added
    - Infrastructure updated

* Task 5. Destroy resources
    - Removed resource added in previous task
    - Infrastructure updated

* Task 6. Use a module from the Registry
    - Module "network" from Terraform Repository added to project
    - Network configuration has been set - 2 subnets created
    - Infrastructure updated
    - Updated configuration resources to connect to created network - subnetwork
    - Infrastructure updated

* Task 7. Configure a firewall
    - Firewall resource created


