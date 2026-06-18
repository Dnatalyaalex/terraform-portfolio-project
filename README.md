## **Client Project Brief**

### *Scenario Overview*

Client: James Smith, freelance web designer
Project: Portfolio Website Deployment

<br>

### *Project Description:*

James Smith has designed a modern, responsive single-page portfolio website using Next.js. He needs this website hosted on a robust, scalable, and cost-effective platform with global availability and fast loading times.

Your Role:
As cloud engineers, you will deploy James's Next.js portfolio website on AWS using Infrastructure as Code (IaC) principles with Terraform.

<br>

### *Requirements*

The website must be:

- Highly Available: Accessible worldwide with minimal downtime
- Scalable: Able to handle increasing traffic without performance degradation
- Cost-Effective: Optimized hosting costs without unnecessary expenses
- Fast Loading: Quick loading times for all visitors globally

<br>

### *Project Objectives*

By completing this project, you will:

- Deploy a Next.js website on AWS
- Implement Infrastructure as Code using Terraform
- Configure global content delivery with AWS CloudFront
- Apply security and performance best practices
- Host all project files and code on GitHub

<br>

### What is Next.js?

 Next.js is an open-source React framework maintained by Vercel that enhances the development experience for building web applications.

<br>

### *Key Benefits*

- Static Site Generation (SSG): Pre-renders pages at build time
- File-Based Routing: Simplified navigation through file structure
- Built-In CSS and Sass Support: Easy styling implementation
- Automatic Code Splitting: Loads only necessary JavaScript for current page

<br>

### *Common Use Cases*

- Static Websites: Blogs, landing pages, and portfolio sites
- E-Commerce Sites: Fast-loading product pages optimized for SEO
- Corporate Websites: Scalable sites for handling significant traffic
- Web Applications: From simple dashboards to complex web apps
- Blogs and Content Sites: Easy-to-maintain, SEO-friendly content platforms# terraform-portfolio-project
ca-module-7

<br>

### *Architecture*

This project is a static website hosted on AWS using S3 and CloudFront.

#### Components:

- **S3 bucket** – stores the built static site files generated in the `nextjs-blog/out` directory
- **CloudFront CDN** – provides global content delivery, HTTPS, and caching
- **Terraform** – provisions all AWS infrastructure as code
- **Users' browser** – accesses the website via CloudFront distribution URL

<br>

### Request Flow:

User → CloudFront → S3 bucket (static files from /out)

<br>

### Deployment

This project uses Terraform for infrastructure provisioning and manual upload for deployment.
Deployment consists of two steps:

#### 1. Infrastructure setup (Terraform)

Terraform is used to create AWS resources:

- S3 bucket for static hosting
- CloudFront distribution
- Required IAM permissions

#### Run Terraform:

```bash
cd terraform-nextjs
terraform init
terraform apply
```

#### 2. Upload all files from the /nextjs-blog/out directory to the bucket root.

<bry>

### Accessing the Website

After deployment:

Open the CloudFront URL provided by Terraform output
The website will be available globally via CDN