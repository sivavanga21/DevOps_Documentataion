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