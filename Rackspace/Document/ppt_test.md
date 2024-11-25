
Expert knowledge on AWS IaM Policy, security, WAF, 
automated security compliance checks using AWS Config Rules and AWS Security Hub, 
integrated with IaC.

Expert knowledge Enforce security and compliance policies using 
AWS Organizations and AWS Service Control Policies (SCPs) via IaC. 
AWS Control Tower


## AWS- WAF (Web Application Firewall)
	https://www.youtube.com/watch?v=FHRXXrQ765M
	
	
IAM Policy:
Identity and Access Management
permissions for users, groups, or roles.
These policies specify what actions are allowed or denied on specific AWS resources.
IAM policies help ensure that only authorized users can perform certain actions, providing a way to manage access control effectively.

Managed Policies: These are standalone policies that you can attach to multiple users, groups, or roles in your AWS account. AWS provides two types:

	AWS Managed Policies: Created and managed by AWS, these policies are designed to provide permissions for common use cases.

	Customer Managed Policies: Created and managed by you, these policies provide more granular control and can be customized to meet specific requirements.

Inline Policies: These are policies that you create and manage directly within a single user, group, or role. 
Inline policies maintain a strict one-to-one relationship between the entity and the policy.

Example: Developer having to EC2 action like StartInstances, StopInstances, DescribeInstances but not TerminateInstances action.
	{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:DescribeInstances"
            ],
            "Resource": "*"
        },
        {
            "Effect": "Deny",
            "Action": "ec2:TerminateInstances",
            "Resource": "*"
        }
    ]
}

 this policy attached to the perticular user groups
 
 ---------------------------------------------------------
## AWS WAF (Web Application Firewall)
 -------------------------------------------------
Allows you to create custom security rules that control incoming HTTP and HTTPS requests and block or allow traffic based on specific conditions. 
between the internet and your web application
WAF can inspect each request and block malicious activity before it reaches the application.
Provides a centralized point for managing and applying security policies across multiple web applications.
Allows for the creation of custom rules to address unique security requirements specific to your application.

in this we have Bot Control dashboards to custmisize the chats for checking the output

in this we have a rule group for in the rule group we have the actions options
	in this we have to custamized creation like source ip 
	WAF (Web Application Firewall) rule builder to create a custom rule that detects 
	when an IP address makes more than 100 login attempts in a minute.
	
	the condition is met (e.g., more than 100 login requests in one minute), the WAF automatically triggers the defined action.
	the action like we have given temporarily block the IP address.

	


-------------
## AWS Security Hub
---------------------
AWS Security Hub gives the comprehensive view of high-priority security alerts and complience status across the AWS account
Automated ongoing security audit of aws account.
Centralized Security Findings of multi accounts.


Integration with GuardDuty, Amazon Inspector, AWS Config, and AWS Firewall Manager, as well as from third-party security products.

Security Standards and Frameworks: 
Security Hub supports frameworks like the Payment Card Industry Data Security Standard (PCI DSS) 
and the General Data Protection Regulation (GDPR), enabling you to track compliance with these standards.

dashboard that visualizes your security status and compliance posture, making it easier to communicate with stakeholders.

Security standards
Enabling AWS Security Hub grants it permissions to conduct security checks. Service Linked Roles (SLRs) 
with the following services are used to conduct security checks: Amazon CloudWatch, Amazon SNS, AWS Config, and AWS CloudTrail.

Benefits:
Unified Security View: Security Hub centralizes security findings from multiple sources into a single dashboard, 
						reducing the complexity of managing security across a large-scale AWS environment.
Continuous Compliance: The service continuously checks your environment against industry standards and AWS best practices, 
						helping you maintain compliance with regulatory requirements.
Automated Security Management: By integrating with AWS Lambda and other automation tools,
								Security Hub allows you to automate responses to security issues,
								reducing the time and effort required to manage security incidents.
Scalable: Security Hub is designed to work at scale, 
		making it suitable for organizations with many AWS accounts and resources.

Enable AWS Foundational Security Best Practices v1.0.0
Enable AWS Resource Tagging Standard v1.0.0
Enable CIS AWS Foundations Benchmark v1.2.0
Enable CIS AWS Foundations Benchmark v1.4.0
Enable CIS AWS Foundations Benchmark v3.0.0
Enable NIST Special Publication 800-53 Revision 5
Enable PCI DSS v3.2.1
PCI DSS - Payment card Industry of Data Security Standrad
CSI- 
GDPR- Genral data protection regulation

------------------------
## AWS Config Rule
----------------
continuously monitors your AWS resources and evaluates them against custom or managed rules
in this some of Managed rules and customized rules 
for best use of Security complience, Audit and Reports

in this internally complince results using console api
monitoring as a cloudwatch and notification of sns topic
snap shot and logs stored in s3 bucket like this the config rule working
when ever added in perticular resoureces it will monitor the cloud watch
	if there any compliance occured the sns notifaction triggers
	and the log data will store in s3 bucket.
	
and in this we have to create rule like dialy or continuous monitor records
	Receive configuration data once every day only if a change has occurred.
	Record configuration changes continuously whenever a change occurs.

Ensure that all EC2 instances are launched only in approved AWS regions 
	to comply with organizational policies and data residency requirements.
	we have some managed rule like ec2-instance-in-approved-regions to create the instance in perticular specified regions.

Custom rules: You can define custom rules using AWS Lambda or managed rules provided by AWS.
Evaluates compliance: AWS Config continuously monitors resources to detect non-compliance.
Remediation: You can set up automatic remediation actions using AWS Systems Manager to resolve non-compliant configurations.
https://www.youtube.com/watch?v=CyyNlyAHs0A

	
------------------------------
## AWS Organizations
---------------------------
Create, manage, and consolidate multiple AWS accounts under a single organization, making it easier to manage billing and permissions.

In this we mintain the Organizations units like child accounts or child companies
in this we have Service control policy
	the service control policy we can use at ou level and account level and root levels as per critiriya
	and we have maintain one builling like multi accounts and multi ous
	it provides centralized monitoring and allow and deny access from centrlization
	this is very usefull to allow and deny the access of any aws resources in the perticular accoune and ou level also.
	
	in this organization we have services and Policy
	
	
	Key Milestones:
2016: AWS first announced AWS Organizations in November 2016 as a preview service. 
		The idea was to provide customers with a tool to manage multiple AWS accounts centrally
2017: General availability with features like consolidated billing and SCPs.
2019: AWS Organizations began integrating with AWS Control Tower, which was launched in 2019. 
		This integration allowed for automated setup and governance of multi-account environments, 
		making it easier to enforce best practices and security policies across all accounts within an organization.
2020-2021: Introduction of advanced governance and security features. like AWS IAM Access Analyzer and 
2022-2023: Continuous improvements and deep integration with other AWS services.
	
	
----------------------
## AWS Control Tower
-------------------
Control Tower is a service that simplifies the setup and governance of a multi-account AWS environment.
It provides a way to create and manage a secure, well-architected AWS environment 

Landing Zone: It will setup of a baseline environment including creating accounts, organizational units

Guardrails: These are pre-configured policies that enforce governance, compliance, and security standards. 
			They include both preventive controls (to block actions that are not allowed) and detective controls (to detect and alert on non-compliance).

Account Vending: It allows you to quickly create and provision new accounts in your AWS Organization, 
					with pre-configured settings for security and compliance.

Visibility and Reporting: It provides dashboards and reports to give you insights into your AWS environment's compliance status and operational health.

----------------------------

## AWS SCPs
----------------------
Key Features of AWS SCPs:

Centralized Permission Management:
	Organization-Wide Control: SCPs enable you to manage permissions centrally across all accounts within your AWS organization. You can define what AWS services and actions are allowed or denied across the entire organization or specific OUs.
	Root User Control: SCPs can restrict even the root user in an account, providing a strong mechanism for enforcing security policies.

Policy Inheritance:
	Hierarchical Enforcement: SCPs are inherited by all accounts and OUs that are part of an organization. This means that an SCP attached at the root level of an organization will apply to all accounts and OUs within that organization, while an SCP attached to a specific OU will apply only to the accounts within that OU.

Deny and Allow Policies:

	Explicit Deny: You can create SCPs that explicitly deny access to certain services or actions, overriding any other permissions that may have been granted through IAM policies.
	Allow Lists: While SCPs generally follow a "deny by default" principle, you can also create allow lists that specify which services and actions are permitted. If an action is not explicitly allowed by an SCP, it is implicitly denied.
			Condition-Based Policies:

Conditional Access: SCPs support conditions, allowing you to specify circumstances under which certain actions are allowed or denied. For example, you can restrict access based on specific regions, IP addresses, or request tags.
Policy Evaluation:

Intersection with IAM Policies: SCPs work in conjunction with IAM policies. When a user or role tries to perform an action, AWS evaluates the SCPs, IAM policies, and resource-based policies to determine whether the action is allowed.
Effective Permissions: The effective permissions for an account, user, or role are the intersection of the permissions granted by IAM policies and the permissions allowed by SCPs.
Pre-Built and Custom SCPs:

AWS-Managed SCPs: AWS provides a set of pre-built SCPs that cover common scenarios, such as denying access to certain regions or services.
Custom SCPs: You can also create custom SCPs tailored to your organization’s specific security and operational requirements.


--------------
SCPs affect only member accounts in the organization. They have no effect on users or roles in the management account.

Users and roles must still be granted permissions with appropriate IAM permission policies. A user without any IAM permission policies has no access, even if the applicable SCPs allow all services and all actions.

If a user or role has an IAM permission policy that grants access to an action that is also allowed by the applicable SCPs, the user or role can perform that action.

If a user or role has an IAM permission policy that grants access to an action that is either not allowed or explicitly denied by the applicable SCPs, the user or role can't perform that action.

SCPs affect all users and roles in attached accounts, including the root user. The only exceptions are those described in Tasks and entities not restricted by SCPs.

SCPs do not affect any service-linked role. Service-linked roles enable other AWS services to integrate with AWS Organizations and can't be restricted by SCPs.

When you disable the SCP policy type in a root, all SCPs are automatically detached from all AWS Organizations entities in that root. AWS Organizations entities include organizational units, organizations, and accounts. If you reenable SCPs in a root, that root reverts to only the default FullAWSAccess policy automatically attached to all entities in the root. Any attachments of SCPs to AWS Organizations entities from before SCPs were disabled are lost and aren't automatically recoverable, although you can manually reattach them.

If both a permissions boundary (an advanced IAM feature) and an SCP are present, then the boundary, the SCP, and the identity-based policy must all allow the action.

Us
------------------------

