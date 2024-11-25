----------------------
## Commands:
---------------------------

## create_Config rules (for create new custom config rules)
cd /root/create_Config
terraform plan  -state="./create_Config/terraform.tfstate"
terraform apply -state="./create_Config/terraform.tfstate"
terraform destroy -state="./create_Config/terraform.tfstate"

## create_SCP (for create new custom scp's)
cd /root/create_SCP
terraform plan  -state="./create_SCP/terraform.tfstate"
terraform apply -state="./create_SCP/terraform.tfstate"
terraform destroy -state="./create_SCP/terraform.tfstate"

## attach scp's in Rax-Mainline Environment
cd /root
terraform plan -var-file="./Rax-Mainline/variables.tfvars" -state="./Rax-Mainline/terraform.tfstate"
terraform apply -var-file="./Rax-Mainline/variables.tfvars" -state="./Rax-Mainline/terraform.tfstate"
terraform destroy -var-file="./Rax-Mainline/variables.tfvars" -state="./Rax-Mainline/terraform.tfstate"

## attach scp's in Rax-POC Environment
cd /root
terraform plan -var-file="./Rax-POC/variables.tfvars" -state="./Rax-POC/terraform.tfstate"
terraform apply -var-file="./Rax-POC/variables.tfvars" -state="./Rax-POC/terraform.tfstate"
terraform destroy -var-file="./Rax-POC/variables.tfvars" -state="./Rax-POC/terraform.tfstate"

## attach scp's in Rax-Sandbox Environment
cd /root
terraform plan -var-file="./Rax-Sandbox/variables.tfvars" -state="./Rax-Sandbox/terraform.tfstate"
terraform apply -var-file="./Rax-Sandbox/variables.tfvars" -state="./Rax-Sandbox/terraform.tfstate"
terraform destroy -var-file="./Rax-Sandbox/variables.tfvars" -state="./Rax-Sandbox/terraform.tfstate"

## attach scp's in Security Environment
cd /root
terraform plan -var-file="./Security/variables.tfvars" -state="./Security/terraform.tfstate"
terraform apply -var-file="./Security/variables.tfvars" -state="./Security/terraform.tfstate"
terraform destroy -var-file="./Security/variables.tfvars" -state="./Security/terraform.tfstate"

--------------------------------
## List of OU's
--------------------------------
## Existing OU's
![alt text](<List of Existing OU.png>)
## New/ Proposed OU's
![alt text](<List of New OU.png>)

## List of controls in controltower
    https://docs.aws.amazon.com/controltower/latest/controlreference/control-metadata-tables.html
    https://docs.aws.amazon.com/controltower/latest/controlreference/all-global-identifiers.html

Control tower controlls behaviour like:

     1. Proactive:   Proactive controls prevent non-compliant resources from being created or modified in the first place. (Blocks creation or modification of non-compliant resources)
        Behavior:    These controls ensure compliance by blocking non-compliant configurations upfront. (Before resource creation)
    
    2. Detective:   Detective controls monitor resources after they are created to detect policy violations or non-compliant configurations. (Monitors and alerts if non-compliance is detected)
        Behavior:    They alert you or generate reports if something goes wrong, but they do not stop the non-compliant action. (After resource creation)
    
    3. Preventive:  Preventive controls restrict certain actions from being performed by enforcing specific permissions or policies, thereby preventing violations of security or compliance rules.(Prevents users from performing specific actions or risky operations)
        Behavior:   Preventive controls impose restrictions that stop users from making changes that violate policies. (Action-level)
