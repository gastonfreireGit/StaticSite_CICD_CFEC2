![image](https://user-images.githubusercontent.com/97241135/153688921-93a2ade0-7423-450e-a00b-0b0abf8b0eaf.png)



<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a>About The Project</a>
    </li>
    <li>
      <a>Getting Started</a>
      <ul>
        <li><a>Prerequisites</a></li>
      </ul>
    </li>
    <li><a>IaC Implementation</a></li>
    <li><a>Static Site Implementation</a></li>
    <li><a>After Implementation</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

With this new implementation, it will be possible to make the change or update of the Static Site automatically when the development team does it in the GitHub repository and impacted in the EC2 instances.

Thus, in this way, optimize go to market times, freeing up teams to focus on generating value and
not wasting time performing manual tasks

![StaticSite AutoScaling EC2](https://user-images.githubusercontent.com/97241135/153689849-9299ffc3-fe2f-4b84-ac9a-60465b5f5c9c.png)

<!-- Prerequisites -->
## Prerequisites

Required Libraries:
* [AWS Cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) with Secret key configured
* [GitHub client](https://git-scm.com/downloads)
* [Terraform](https://www.terraform.io/downloads)

Required AWS configuration:
* AWS S3 Bucket Backend
* Origin Access Identity
* GitHub Connection 


### AWS S3 Bucket Backend:

This bucket is necesary to store the status of the infrastructure deployed using Terraform (terraform.tfstate). In case you need to lock the satus of this file to work with a team, we need to implement a DynamoDB to lock it.

To create this bucket follow these steps:

→ In Aws Console > search S3 > in left section select Buckets > Create Bucket > Specify the Name > click on “Create Bucket”
→ In each environment  in terraform file (Dev, Test and Prod) place the name of the bucket in the value of "bucket“ in main.tf file, line 3.


### Origin Access Identity
To restrict access to content that you serve from Amazon S3 buckets we need to create an OAI, to do this follow these steps:

→ In Aws Console > search CloudFront service > in left panel click on Origin Access Identity > click on “Create origin access identity” > Enter a name > click on “Create”
→ Copy the ID column value (e.g.: E26RWMOJBFTRWY) and past it into “id” value in “modules > cf-modules > cloudfront.tf” line 3 in terraform file.

### GitHub Connection 
To connect to GitHub we will need a connection before implement IaC, to do this follow these steps:

→ In Aws Console > search CodePipeline service > in left panel click on Connections, under Settings section > click on “Create connection” > Select GitHub > enter Connection Name > click on “Connect to GitHub > click on “Install a New app” > log in to GitHub > click on “Connect”
→ Copy ARN column value in folder Modules > cp-module > codepipeline.tf > ConnectionArn value, line 25 in terraform file.


<!-- IaC Implementation -->
## Infrastructure as Code (IaC) Implementation

Once you have the prerequisites installed, in terminal console, run these commands:

1. Clone the repo
   ```
   Git clone https://github.com/gastonfreire3XM/StaticSite_CICD_CFS3
   ```
2. In “iac-code”  branch you will see this folder structure: 

![image](https://user-images.githubusercontent.com/97241135/153688997-c1c1575c-a7cd-492b-94a7-cb42d3ab1813.png)

If you need to implement one of these environment **Dev, Test or Production,** you need to position yourself in one of these folders, for this example, we will use *“dev”*. 

In terminal console exec this commands:

1. 
   ```
   cd .\environments\dev
   ```
2. 
   ```
   terraform init
   ```
3. 
    ```
    terraform plan
    ```
 4. 
    ```
    terraform apply -auto-approve   
 *In case you need to destroy the Infrastructure:*


 ```
terraform destroy
 ```


  <!-- Static Site Implementation -->
## Static Site Implementation


As an output value after “terraform apply” command, you will see the CloudFront URL to access to the Static Site (e.g.: https://d3oe147kj.cloudfront.net/ ).

To change the Static Site page, follow one of these steps:

### Using GitHub terminal:

You will see three different branches, **Main** (Production), **static-site-test** (test) and **static-site-dev** (dev). For this example, we will use “static-site-dev” branch, here you can modify the *index.html* file and then in terminal console: 
  
```sh
Git add index.html
Git commit –m ‘a comment here’
Git push
   ```
It will be triggered by AWS CodePipeline and it’ll update the site for Dev environment

### Using GitHub Web:

Login to:
```
https://github.com/gastonfreire3XM/StaticSite_CICD_CFEC2
   ```  
You will see three different branches, **Main** (Production), **static-site-test** (test) and **static-site-dev** (dev).

![image](https://user-images.githubusercontent.com/97241135/153016454-297288d4-25f5-4efc-8ec3-97d7ca7385c6.png)

For this example, we will use **“static-site-dev”** branch. Select the branch and then you can change and push it there the *index.html* file selecting “Edit this file” button ![image](https://user-images.githubusercontent.com/97241135/153016593-cc20a0e1-93ef-4782-8149-a7d140258399.png)



<!-- After Implementation -->
## After Implementation

To verify the status of the implementation you can go to AWS Console and check the status of the following services:

- _AWS CodePipeline_

- _AWS EC2_

- _AWS LoadBalancer_

- _AWS Autoscaling_

- _AWS CloudFront_

______________________________________________________________________________________________________________
**AWS CodePipeline:**
![image](https://user-images.githubusercontent.com/97241135/153689140-9a4cbbab-9dc2-416d-8cac-79ece5d04ea3.png)


**AWS EC2:**
The number of EC2 instances will depends on the configuration of AWS Autoscaling Group service.
![image](https://user-images.githubusercontent.com/97241135/153689167-181b233c-9f94-4f7d-aca0-8f3c11c090bb.png)

**AWS CloudFront:**
![image](https://user-images.githubusercontent.com/97241135/153689172-6e522c8c-46e1-4691-93b6-778a25e067e4.png)

**AWS CloudFront Invalidation:**

- ### Using AWS Console:

![image](https://user-images.githubusercontent.com/97241135/153607059-1a02a0ee-931a-4675-b9bd-bf239a4fd613.png)

![image](https://user-images.githubusercontent.com/97241135/153607075-16e09749-8aa3-4803-a036-de917fe5e670.png)

- ### Using AWS CLI:

 ```
aws cloudfront create-invalidation --distribution-id <DistributionID> --paths "/*"
 ```
**AWS Autoscaling:**

AWS Auto Scaling monitors your applications and automatically adjusts capacity to maintain steady, predictable performance at the lowest possible cost. Using AWS Auto Scaling, it’s easy to setup application scaling for multiple resources across multiple services in minutes.

![image](https://user-images.githubusercontent.com/97241135/153689210-27a33c35-c6cc-4360-aa2e-0f4240309388.png)

**AWS Load Balancer:**

Elastic Load Balancing (ELB) automatically distributes incoming application traffic across multiple targets and virtual appliances in one or more Availability Zones (AZs).

![image](https://user-images.githubusercontent.com/97241135/153689246-0d0c7313-8b9c-4f91-ab6f-bdb631c08c50.png)

