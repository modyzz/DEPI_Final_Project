# DEPI Final Project

A complete DevOps CI/CD pipeline for a Java web application. This project automates the entire software delivery lifecycle—from building and testing to containerization, deployment, and monitoring.

---

## 📄 Project Overview

- **Application**: Java-based web application (JPetStore).
- **Deployment**: Dockerized and deployed on a virtual machine using Ansible.
- **Access URL**: [http://localhost:8089/jpetstore](http://localhost:8089/jpetstore)

---

## 📊 Tech Stack

| Purpose                     | Tool/Technology        |
|----------------------------|------------------------|
| Version Control            | Git & GitHub           |
| Build Tool                 | Maven (via `mvnw`)     |
| Containerization           | Docker                 |
| CI/CD                      | Jenkins                |
| Configuration Management   | Ansible                |
| Monitoring                 | Prometheus, Grafana, Node Exporter |

---

## ✅ CI/CD Pipeline

### Continuous Integration (CI)

1. **Checkout Code**: Jenkins pulls the latest code from GitHub.
2. **Build Project**: Uses Maven Wrapper (`mvnw`) to build the application:
   ```sh
   chmod +x mvnw
   ./mvnw clean package
   ```
3. **Run Tests**: Executes unit and integration tests:
   ```sh
   ./mvnw test
   ```
4. **Run Ansible Playbook**: Jenkins triggers `ansible-playbook.yml` to:
   - Build the Docker image
   - Push the Docker image to Docker Hub
  
     
### Continuous Deployment (CD)

1. **Run Ansible Playbook**: Jenkins triggers `ansible-playbook.yml` to:
   - Deploy the application container
   - Start Prometheus
   - Start Node Exporter
   - Start Grafana and provision dashboards

---

## ⚡ Getting Started

### Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Jenkins](https://www.jenkins.io/doc/book/installing/)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Prometheus](https://prometheus.io/docs/introduction/overview/)
- [Grafana](https://grafana.com/grafana/download)
- [Node Exporter](https://prometheus.io/docs/guides/node-exporter/)

### Installation Steps (Using Jenkins)

1. **Set Up Jenkins Job**:
   - Configure a Jenkins Pipeline job.
   - Use the provided `Jenkinsfile` from the repository.

2. **Connect Jenkins to GitHub**:
   - Set GitHub repository URL in Jenkins job configuration.
   - Enable GitHub webhook (optional for auto-trigger).

3. **Run the Job**:
   - Jenkins will:
     - Build the application with Maven
     - Run tests
     - Trigger the Ansible playbook for build, push Docker image, deployment and monitoring setup

4. **Access the App**:
   Open [http://localhost:8080/jpetstore](http://localhost:8080/jpetstore)

---

## 📚 Repository Structure

```
DEPI_Final_Project/
├── .mvn/                     # Maven Wrapper files
├── src/                      # Application source code
├── Dockerfile                # Docker build instructions
├── Jenkinsfile               # CI/CD pipeline config
├── ansible-playbook.yml      # Ansible deployment script (deploy, monitor)
├── prometheus.yml            # Prometheus configuration
├── grafana/                  # Grafana provisioning & dashboards (optional)
├── LICENSE                   # License info (Apache 2.0)
└── NOTICE                    # Legal notices and attributions
```

---

## ☑ Notes

- The application builds a `.war` file (not `.jar`). Ensure your deployment method supports it.
- Jenkins pipeline uses `mvnw` to eliminate Maven installation requirements.
- Prometheus is configured to scrape metrics from Node Exporter and your application.
- Grafana is used to visualize collected metrics via dashboards.
- Ansible handles deploying the Docker image and starting all monitoring tools.

---

## 📚 License

This project is licensed under the [Apache 2.0 License](LICENSE).

---

Feel free to fork or contribute — PRs are welcome!

