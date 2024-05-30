# Explanation

## Order of Execution
The Terraform script (`main.tf`) provisions an AWS EC2 instance and then uses a `local-exec` provisioner to run the Ansible playbook (`playbook.yml`). This ensures the server is configured immediately after it is created.

## Ansible Playbook
The Ansible playbook performs the following tasks:
1. Updates the apt cache
2. Installs Docker
3. Starts and enables Docker service
4. Adds the user to the Docker group
5. Deploys the application container
6. Copies application files to the server

## Ansible Modules Used
- `apt`: For package management
- `systemd`: To manage system services
- `user`: To manage user accounts
- `docker_container`: To manage Docker containers
- `copy`: To copy files to the server