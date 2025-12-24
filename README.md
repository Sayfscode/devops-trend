This project implements a complete DevOps workflow to containerize a web application, automate its build pipeline using Jenkins, deploy it on an AWS EKS Kubernetes cluster, and expose it via a LoadBalancer service.

1.	Application Containerization using Docker
2.	Jenkins Pipeline builds & pushes the Docker Image
3.	Terraform provisions AWS EKS
4.	Application deployed into EKS using kubectl manifests
5.	Service created as LoadBalancer to expose the app


Docker Image Build & Push

The application was containerized and pushed to Docker Hub


Jenkins was installed on an EC2 instance and configured.


The pipeline:
	•	Pulled the GitHub repo
	•	Built Docker image
	•	Tagged & pushed to Docker Hub
	•	Logged Finished: SUCCESS

AWS EKS Cluster (Terraform)

Terraform was used to provision the Kubernetes cluster.

Cluster ARN:arn:aws:eks:ap-south-1:496009355984:cluster/trend-eks


Kubernetes Deployment

Deployment manifest applied successfully

Pods are Running


Kubernetes Service (LoadBalancer)

Service manifest created a LoadBalancer service

Load Balancer Issue 
The only component that did not complete was the AWS ELB provisioning.
The Kubernetes service remained in PENDING STATE,while the service object exists,This happened after everything was built correctly — meaning:

Cluster works
Nodes work
Pods run
Service is valid
Terraform applied successfully
CI/CD worked

Only the external ELB allocation was blocked by AWS  AWS could not attach a public IP.




Final Summary

Although the AWS external LoadBalancer could not be provisioned due to issues the full DevOps pipeline was successfully implemented and proven working up to Kubernetes service exposure.

