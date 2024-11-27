-------------------------
Monitoring Tools
-------------------
Monitoring Service---                       CloudWatch  |   Azure Monitor
Application Performance Monitoring---       X-Ray/Cloud watch application Insight  |   Application Insights
Log  Analysis---                            CloudWatch/ Cloud Watch Log  |   Log Analytics
Network Monitoring---                       VPC Flow Logs/ Network Manager  |   Network Watcher
Container Monitoring---                     CloudWatch Container Insights  |   Azure Container Insights
Database Monitoring---                      CloudWatch RDS  |   Azure Database Monitor


----------------------
Audit Tools
----------------------
## AWS Config:


## Security Hub
## Inspector

----------------------
Management Tools
----------------------


----------------------
Networking Tools
----------------------
Route53
VPC
ELB
VPN
Direct Connect
NAT Gateway
Elastic IP
Security Groups
Network ACLs
VPC Flow Logs
CloudFront
API Gateway
WAF
Shield
S3 Transfer Acceleration
CloudFront
API Gateway
WAF
Shield
S3 Transfer Acceleration
CloudFront
API Gateway
WAF
Shield

----------------------
Storage Tools
----------------------
## S3 Bucket
    Types of S3 Buckets Based on Storage Class

    S3 Standard: For frequent access. High durability, availability, and low latency.
    Example: Storing user-uploaded files on an e-commerce website.

    S3 Intelligent-Tiering: Automatically moves objects between different storage tiers based on access patterns.
    Example: Storing machine learning datasets with unpredictable access patterns.

    S3 Standard-IA (Infrequent Access): For infrequently accessed but immediately available data.
    Example: Monthly financial reports or archived logs.

    S3 One Zone-IA: For data that can tolerate a loss of availability from an AZ failure.
    Example: Replicas of non-critical backups.
             There is no backup of data in S3 One Zone-IA.

    S3 Glacier: For archiving data with retrieval time ranging from minutes to hours.
    Example: Long-term storage of compliance records.

        Subtypes:
        Glacier Instant Retrieval:
        Example: A media company stores high-resolution images and video clips that are occasionally needed for marketing campaigns or archival purposes.
        The company retrieves these files instantly when required for specific projects, without high storage costs.
        Glacier Flexible Retrieval:
        Example: A financial institution stores quarterly financial statements or audit reports that are accessed during audits or compliance checks.
        Retrieval occurs only during specific periods (e.g., end-of-quarter reviews).
        Glacier Deep Archive:
        Example: A research organization stores large datasets for long-term analysis and preservation.
        Data retrieval is infrequent and requires significant time (days to months).

    S3 Outposts: Extends S3 storage to an on-premises AWS Outposts environment.
    Example: Storing data in environments with strict data residency requirements.

## EBS
    Elastic Block Store (EBS) is a block-level storage service that provides persistent storage for Amazon Elastic Compute Cloud (EC2) instances.
    EBS volumes are replicated across multiple Availability Zones to ensure high availability and durability.

    ## Your application running on an EC2 instance is running out of disk space. You want to attach a new EBS volume to add storage without downtime.
    aws ec2 create-volume --size 50 --volume-type gp3 --availability-zone us-east-1a
    aws ec2 attach-volume --volume-id vol-0123456789abcdef0 --instance-id i-0123456789abcdef0 --device /dev/xvdf

    ## You need to move an EBS volume from us-east-1 to us-west-2.
    aws ec2 create-snapshot --volume-id vol-0123456789abcdef0 --description "Snapshot for migration"
    aws ec2 copy-snapshot --source-region us-east-1 --source-snapshot-id snap-0123456789abcdef0 --destination-region us-west-2
    aws ec2 create-volume --snapshot-id snap-abcdef0123456789 --availability-zone us-west-2a

    ## Take regular snapshots of your EBS volumes to ensure data backup for disaster recovery.
    aws ec2 create-snapshot --volume-id vol-0123456789abcdef0 --description "Backup snapshot"
    aws ec2 create-volume --snapshot-id snap-0123456789abcdef0 --availability-zone us-east-1a

    ## we can use command for check the cpu memory usage:
        top and htop
        https://linuxconfig.org/linux-basic-health-check-commands
        https://linuxconfig.org/check-cpu-and-ram-usage-of-a-kubernetes-pod

----------------------
Compute Tools
----------------------
EC2
Lambda
Fargate
EKS
ECS
Elastic Beanstalk
Batch
Lightsail
Elastic Container Registry
Elastic Container Service
Elastic Kubernetes Service


----------------------
Database Tools
----------------------
RDS
DynamoDB
Redshift
Aurora
Elasticache
Neptune

----------------------
Application Services
----------------------
## SNS: Simple Notification Service
## SQS: Simple Queue Service

EventBridge
App Runner
App Mesh
Elastic Beanstalk
CodeDeploy
CodePipeline
CodeBuild
CodeCommit
CodeStar
CodeStar Connections
CodeStar Notifications
CodeGuru
CodeGuru Profiler
CodeGuru Reviewer
CodeGuru Security
CodeArtifact
CodeWhisperer

----------------------
Migration Tools
----------------------

----------------------
Analytics Tools
----------------------
Athena
EMR
Kinesis
QuickSight
Redshift
Quicksight
SageMaker
SageMaker Canvas
SageMaker Feature Store
SageMaker Ground Truth
SageMaker Model Monitor
SageMaker Pipelines
SageMaker Studio
SageMaker Studio Lab
SageMaker Training Compiler
SageMaker Debugger
SageMaker Edge Manager
SageMaker Feature Store
SageMaker Ground Truth
SageMaker Model Monitor
SageMaker Pipelines
SageMaker Studio
SageMaker Studio Lab
SageMaker Training Compiler

----------------------
IoT Tools
----------------------
IoT Core
IoT Device Defender
IoT Device Management
IoT Events
IoT Fleetwise
IoT Greengrass
IoT SiteWise
IoT Things Graph
IoT TwinMaker

----------------------
DevOps Tools
----------------------


----------------------
Security Tools
----------------------
AWS Certificate Manager
AWS CloudHSM
AWS CloudTrail
AWS Config
AWS IAM
AWS Secrets Manager
AWS Shield
AWS WAF
AWS WAF Regional
AWS Web Application Firewall (WAF) Classic
AWS X-Ray
AWS Firewall Manager
AWS IAM Access Analyzer
AWS IAM Identity Center
AWS IAM Roles Anywhere
AWS Lake Formation
AWS Macie
AWS Organizations
AWS Resource Access Manager
AWS Security Hub
AWS Single Sign-On
AWS Systems Manager
AWS Well-Architected Tool
AWS Audit Manager
AWS Artifact
AWS CloudShell