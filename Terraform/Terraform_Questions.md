## what is terraform and why is it used?
   Terraform is an open-source Infrastructure as Code (IaC) tool that allows you to define and manage your infrastructure (like servers, networks, and storage) using code. It is developed by HashiCorp and uses a declarative language to describe infrastructure resources.
  1) Automate infrastructure creation, update, and deletion.
  2) Ensure consistency by codifying the infrastructure.
  3) Collaborate easily since the configuration can be stored in version control.
  4) Support multiple cloud providers, such as AWS, Azure, and GCP.

## main componets of terraform 
  1) Providers--think of providers as the bridge to communicate with cloud platforms (like AWS, Azure).
  2) Resources--Resources are the actual components Terraform creates, like servers or databases.
  3) Modules--Modules are reusable Terraform configurations, like pre-built templates.
  4) Variables--Variables make your configuration dynamic by allowing inputs.
  5) State--Terraform keeps a record of what’s been created in a "state file."
  6) Output--Outputs show important details after running Terraform.
  7) Provisioners--Provisioners help you configure resources after creation.

## what file types does terraform use
  1) .tf(Terraform Configuration Files)--Contains the actual infrastructure code to define resources, providers, modules, etc.
  2) .tfvars (Terraform Variables Files)-- Stores input values for variables defined in .tf files.
  3) terraform.tfstate (Terraform State File)--Stores the current state of the infrastructure managed by Terraform.
  4) terraform.lock.hcl (Provider Dependency Lock File)--Ensures consistent provider versions across different environments.
  5) .backup (State Backup File)-- Automatically created backups of the state file before any changes.
  6) .json (Terraform JSON Files)--Terraform configuration in JSON format (less common but supported).
  7) .hcl (HashiCorp Configuration Language)
  
## what is terraform tf.state 
 Terraform state is a file (terraform.tfstate) that Terraform uses to store information about the real-world infrastructure it manages. It acts as a "source of truth" for Terraform to track the resources it has created, modified, or destroyed.
 (to store the information about infrastructure creation)

## terraform init command used for 
   The terraform init command is used to initialize a working directory containing Terraform configuration files. It sets up all the necessary prerequisites so Terraform can execute commands like plan, apply, or destroy.

## difference between terraform apply and plan
terraform plan-- is a Terraform command used to preview the changes that Terraform will make to your infrastructure when you run terraform apply. It helps you understand what will happen before any actual changes are made, providing a "dry run" of your desired infrastructure configuration.

terraform apply is a Terraform command used to execute the actions required to align your infrastructure with the configuration defined in your Terraform files. It implements the changes necessary to achieve the desired state, such as creating, updating, or deleting resources.
(terraform apply command used to create the infrastructure as defined in the state file)

##  what are terraform modules? how it is usefull
Terraform modules are a way to organize and reuse code in Terraform configurations. 
A module is essentially a container for multiple resources that are used together. 
(A module can be a single resource or a collection of resources, and it can be called and reused across different configurations.)
  (module is a just like a floder it can contains resources data sources varibles and 
  outputs to maintain structure)
  (module is used for re use builty of different environments module is used for ensure same standars are applied accross environments)
 ex: (in my project iam useing reuseble modules for vpc,ec2,s3,iam policies,)

Modules help in structuring Terraform code into logical components, promoting code reusability, and reducing duplication. They can either be local (within the same project) or remote (from the Terraform Registry or external sources like GitHub).

1) Root Module: Every Terraform configuration has a root module, which is the directory containing the main configuration files.
2) Child Module: Modules can call other modules, known as child modules, which help break down complex configurations into smaller, manageable pieces.
3) Input Variables: Modules can accept input variables to customize the resources created by the module.
4) Output Values: Modules can produce output values that can be used by other modules or the root module.
5) Remote Modules: Terraform allows you to use modules from the Terraform Registry or external sources.
6) Published Modules: this module shared via terraform registory or git for the purpose community verified modules for common usage 

## what is backend in terraform 

In Terraform, a backend is the configuration that determines how Terraform stores state files and manages the operations for your infrastructure.
It defines where Terraform’s state data (such as the current configuration of your resources) is stored, how it is locked for concurrent operations, and how it is accessed.
By default, Terraform stores the state locally in a file called terraform.tfstate. However, in a team environment or for larger-scale infrastructure, it is common to use remote backends to store the state file securely, manage locking to prevent concurrent changes, and facilitate collaboration.

## how does terraform handle sensitive data like secrets
  (terraform allows making a varibles as a sentive to prevent it from display enviroment)
  (sentive data like secrets will be saved in plain text in the state file )
  (all sentive data will be stored in varibles.tf file)
  (terraform can use environment varibles to pass secrets with out hardcoring them)
  ex: use environment varible to pass sensitive data securely data to terraform 
  export TF_VAR_DB_PASSWORD="SECURE_PASSWORD"

## WHAT ARE WORKSPACES IN TERRAFORM AND ITS USE CASES
    Workspaces in Terraform provide a way to manage multiple environments (e.g., development, staging, production) within a single Terraform configuration. 
    They allow you to maintain separate state files for each environment, preventing conflicts and enabling easier management of resources.
    (to maintain separate files for different environment like dev,uat,production,staging with out duplicatin terraform code)
    (each workspace has its own state file ensure the changes in one workspace does not affect other workspace)
    # terraform workspace new <workspace_name>
    # terraform workspace new dev
    # terraform workspace list

(terraform workspace select dev
terraform apply)

## what is the purpose of the terraform taint and untaint 
    terraform taint
    --(Marks a specific resource for recreation during the next terraform apply run.)
    --(When you need to recreate a resource (e.g., due to a suspected issue, configuration drift, or to test a change)
    without modifying the resource's configuration.)
    COMMAND (terraform taint aws_instance.example)

    terraform untaint
    --(Removes the taint (mark for recreation) from a resource.)
    --(If a resource was previously marked as tainted (manually or due to an error)
    but you no longer want it to be recreated, you can use this command to unmark it.
    cCOMMAND (terraform untaint aws_instance.example)

## difference between local exec and remote-exec
    local exec- (Runs the command locally on the system where Terraform is being executed.)
                (When you want to execute a script or command on your local machine, 
                such as interacting with a local CLI tool or triggering other workflows.)

    remote exec- (Runs the command remotely on the resource created by Terraform (e.g., an EC2 instance or a virtual machine).
                (When you want to execute commands on the remote resource, such as installing software or configuring the resource after it is created.)

## how do you handle drift detection in terraform
    (terraform drift is identifying difference of between the acutal state infrastructure file and desire state difined in cloud)

## what does terraform validate command used for
    The terraform validate command is used to check the syntax and structure of the Terraform configuration files.
    It ensures that the files are correctly formatted and that the configuration is valid, but it does not actually apply any changes to the infrastructure.

## what is the function of terraform fmt 
    reformat your confirgation file structure
    ex: no of people are working on same repo one people not write the proper structure format of terraform that time we use for terraform fmt command 
    command for restructure the file

## what would use terraform destroy
    we can use terraform destroy command to destroy the infrastructure througth state file 
    delete our resources in clould environment

## how does the terraform state list command work 
    to find out the resources in state file paritucal resource
    comamnd terraform state list [{resource_id}]
            terraform state list [options] [address]

## how does the terraform state show
    give detailed information about specific resources in state file

## explain use of terraform output
    terraform output command is used to retrive and display the output files in terraform configaration
    if you want know the specific resources of ec2 instance id use this command 
    if you retrive output value to json file we can use below command terraform output -json > output.json
    command: terraform output instance id

## what does terraform refresh do
terraform refresh command differenciate the current state file and real world of infrastructure 

## what is the of terraform import command
we need to import exsisting resources in to terraform state file with out modifying the resources

## what is the terraform graph command
terraform grapth is visulize how your resources intraction each other with each other
ex: we create an vpc ec2 ,s3 these resources are interconnected because the ec2 instance lanch in the vpc
the structure display like graph


## what is terraform lock and unlock terraform command
terraform lock command is used to lock the state file and terraform unlock command is used to unlock the state file
when you run terraform commands like terraform applly,plan it automatically locak the state file
you can use the terraform force-unlock command manuall realese the state file this is use full for state file is locked getting error

## Terraform Lock and unlock
    Locking happens automatically when you run terraform apply, terraform plan
    Unlocking happens when operation completes.
    if the unlock is not happen we can use this command terraform force-unlock <LOCK_ID>

## Terraform --auto-approve
    it will use to bypass the manuall approvals

## Remove the resource from the state file without delete in the state file
    terraform state rm <resource_type>.<resource_name>
    but it will not delete the resource from the cloud only changes in state file.

## what command whould you used to apply changes from previosuly saved execution
    if we have a state file and we want to apply the changes from that state file we can use this command terraform apply -state <state_file_path>

## How whould you trabuleshoot failed terraform run
    Check provider issue: Sometimes, the issue might lie with the cloud provider authendication issue

## what is the purpose of -var in terraform
    The -var flag is used to pass variable values to Terraform at runtime, overriding the values in .tfvars files or defaults in the configuration.

## Terraform state pull
    pull the latest state file from the backend
    This command allows you to download the state file to your local machine.

## how do you test the configuration without creating the resources
    use terraform plan command to test the configuration without creating the resources.

## How do you resolve the state file conflects
    State file conflicts can happen when multiple people or processes are working on the same infrastructure. Here are some ways to resolve conflicts:

    Use backend state locking to prevent concurrent changes.
    Manually resolve conflicts by inspecting and modifying the state file (terraform state pull to download, then manually edit or merge changes).
    Use terraform refresh: This updates the state with the current infrastructure state.

## what is the purpose of count for each and dynamic

## what is terraform D

## terraform.tfstate.backupfile
    The terraform.tfstate.backup file is a backup of the previous state.
    Terraform creates this backup file automatically before updating the state. 
    If the main terraform.tfstate file becomes corrupted or if you need to roll back, you can use the backup file.

## How to change created resources using terraform
    To change created resources using Terraform, modify the configuration files and then run terraform apply to apply the changes. Terraform will determine the difference between the current state and the desired state and make the necessary adjustments.

## after terraform apply, state file created where its stored
    it stores locally and remotely
    by default it stores in local
    if you want to take backup of state file you can store in s3 bucket for desoster recovery also.
    we can maintain versioning on the s3.

## if we missed terraform.tfstate in terraform how should clear the issue
    restore the state file from backup if you have
    other wise we can use import command to import the resources

## life cycle of terraform
    write configuration files like .tf files
    run terraform init
    run terraform plan
    run terraform apply
    run terraform destroy

## how we can destroy one perticular resouces
    terraform destroy -target=resource_name

## Remote backend in terraform
    we can use remote backend to store the state file in remote location like s3

## Multiple ways to provide variables can we mention variable run time
    terraform apply -var="instance_type=t2.micro"
    terraform apply -var-file="dev.tfvars"
    export TF_VAR_instance_type="t2.micro"
    terraform apply


## Your team is adopting a multicloud stategy and you are responsible for managing the infrastructure. You need to create a terraform configuration that deploys a virtual machine in two different cloud providers. How would you structure your terraform configuration to achieve this?
    to deploy the vms in differnt clouds use provider blocks and use different resources for each provider

## your company is looking ways to enable high availbilty how can you perform blue green deployment in terraform
    blue green deployment is not supported by terraform but we can use canary deployment
    
    A blue-green deployment ensures zero downtime during application updates by maintaining two identical environments (blue and green). In Terraform, you can manage the infrastructure for both environments and switch traffic to the new one once it's ready.

## terraform state pull and push
    State Pull: To retrieve the current state of the infrastructure
    State Push: To upload a state file back to the backend

## what is terraform module registory 
    The Terraform Module Registry is a central repository for Terraform modules. You can find pre-built, reusable modules for various resources like AWS, Azure, and Google Cloud 

## how can you implemented automated testing for terraform code
    Automated testing for Terraform can be achieved using tools like:

    Terraform Compliance: To ensure Terraform configurations comply with policies.
    Checkov: A static analysis tool for Terraform files.
    Kitchen-Terraform: To test the infrastructure with tools like Test Kitchen.

## how to migrate from terraform 0.12 to 1.0
    Run terraform 0.13upgrade to automatically update your configuration files for compatibility with newer versions.
    Review the Terraform upgrade guides for version-specific changes (e.g., changes in module syntax, provider versions).

## we have exiting infrasturucture created in azure cloud now one perticular reources need to be re created when ever we do the next apply
    You can use the lifecycle block with the create_before_destroy option to ensure that Terraform recreates the resource every time it applies changes. 
    This option will first create the new resource before destroying the old one, ensuring no downtime.

## step by step process of secure.tfstate file and making it radily available for other developers with in the team
    create s3 bucket for store the state file
    create Dynamo DB table for state locking 
        [Go to the DynamoDB console and create a new table e.g., terraform-locks| Set the Primary Key as LockID (String)]
    Configure the Backend in Terraform
        terraform {
            backend "s3" {
                bucket         = "my-terraform-state"
                key            = "terraform.tfstate"
                region         = "us-west-2"
                dynamodb_table = "terraform-locks"
                encrypt        = true
            }
        }    

## who creates the terraform.tfstate.backup file and under which scenario it is created
    The .terraform.tfstate.backup file is automatically created by Terraform as a backup of the previous state file.
    It's generated after any terraform apply to ensure that if something goes wrong, you can revert to the previous state.

## if you want to create ec2 inatsnce using terraform and then execute a shell script on the instance after its has been created how can you do that
    we can use the user_data to execute a shell script on the instance after its has been created

## you want to create terraform module that can be reused across different projects how can you do that but you need to parameterize the certain value that are specific to each project
    To create reusable Terraform modules, organize your code into separate directories and parameterize the values that change for each project. Use input variables for customization.

## difference between terraform import and terraform data source
    Terraform import is used to import existing infrastructure into Terraform, while terraform data source is used to retrieve data from external sources.

    Import: Once a resource is imported, Terraform manages it and can create, update, or destroy it.
    Data Source: Data sources are used to retrieve data from external sources, such as AWS API or other services, and can be used to populate variables or to create new resources based on the retrieved data.

## Difference between user_data and provisioner in terraform
    User data is a script that is run on the instance when it is launched, while provisioner is a way to run scripts or commands on the instance after it has been created.

    User data is typically used to set up the initial configuration of the instance, such as installing software or configuring services. It is run when the instance is launched and is not affected by changes to the Terraform configuration. 