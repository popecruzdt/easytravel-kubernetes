# Kubernetes EasyTravel

This repository contains a YAML file called ``easytravel-k8s-deploy.yaml``. This file contains every configuration needed to deploy a working easytravel deployment into an existing kubernetes cluster.

You can deploy Easytravel to the cluster using the command: ``kubectl create -f https://raw.githubusercontent.com/bstyx09/Kubernetes-Easytravel/master/easytravel-k8s-deploy.yaml``

-----------------------
Once you have done this easytravel should start right up with traffic running automatically. There is nothing else needed to be done to start seeing data if you are monitoring this with Dynatrace.
The loadgenerator will automatically start running traffic on the application

This will create:
- a kubernetes namespace called "easytravel"
- 5 deployments:
  - easytravel-frontend
  - easytravel-angular-frontend
  - easytravel-backend
  - easytravel-mongodb
  - load generator
- 4 services:
  - easytravel-frontend-service
  - easytravel-angular-frontend-service
  - easytravel-backend-service
  - easytravel-mongodb-service

You can confirm that these were all created succesfully by running the command:
``kubectl get all -n easytravel``

If you want to run traffic manually to your shiny new easytravel application, you can access it manually using the address: ``http://<kubernetes-worker-node>:30080`` where ``<kubernetes-worker-node>`` is the IP or DNS entry for any worker node in your Kubernetes cluster.

The Angular frontend is available at ``http://<kubernetes-worker-node>:30081``

# LICENSE
easyTravel Docker is licensed under the MIT License.  For more information please refer to the easyTravel-Docker repository.
https://github.com/Dynatrace/easyTravel-Docker
