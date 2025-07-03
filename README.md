# Docker Compose Setup with Ollama AI Model and Jupyter Notebook Environment 

This repository provides an integrated setup that allows you to run a containerized version of both an advanced Artificial Intelligence model named `Ollama` as well as the widely-used data analysis tool, Jupyter Notebook. This configuration is particularly optimized for environments where GPU acceleration (if available) can be leveraged through NVIDIA CUDA technology enhancing performance significantly while interacting with Ollama models directly within a notebook interface.

## Features 
Here's what you get when using this setup:
- **Integrated Ollama Service** - Access and utilize the functionality of various AI models via APIs for tasks like loading, generating text or data representations etc., all right from your Jupyter Notebook environment. This integration ensures seamless interoperability between `Ollama` service container and a notebook-based application allowing realtime interactions with Ollama's capabilities directly within the Python programming language ecosystem of Jupyter, without any external dependencies or installations required on your end apart from Docker itself.
  
  - **Jupyter Notebook Environment**: The jupyter service container provides an interactive and fully-functional notebook interface for data scientists where you can write scripts in Python (or other supported languages), run these, visualize results as well execute the Ollama AI model directly within your environment.
  
  - **GPU Acceleration**: Enhance processing speed of heavy computations using NVIDIA GPUs via CUDA technology if they are available and compatible with this setup (optional). This acceleration can be especially beneficial for computationally intensive models, providing a much smoother user experience.
  
## Requirements 
To make the most out of this Docker Compose configuration you will need:
- **Docker** - Installation instructions available at [https://www.docker.com/](https://www.docker.com/) for users on different platforms (Windows, macOS and Linux). Be aware that certain commands may vary based on your operating system type; please refer to the official documentation provided by Docker during installation process or in this repository's `README` file itself under 'Getting Started'.
- **NVIDIA GPU** - Optional but recommended if you want to utilize GPU acceleration. Ensure compatibility with CUDA technology and check [https://www.nvidia.com/cuda](https://www0.gsu.edu/academia/) for compatible NVIDIA products, drivers as well guidance on installation process.
  
## Getting Started 
Here's how you can get started with this setup:
- **Clone the Repository** - Clone repository to your local machine by executing `git clone git@github.com:moh-C/Jupyter-Ollama.git` in a terminal or command prompt window and navigate into it using 'cd Jupyter-Ollama'.
  
  (Note for security reasons, the default root password is set as "root". Please consider changing this when moving to production environments.)
  
- **Build and Run Containers** - Open your Docker terminal or command prompt within repository's directory. Execute `docker-compose up -d` which will build necessary images based on their configuration if they are not already present, then start the containers as per defined settings in docker-compose file (the setup starts operating seamlessly with these services running). The '-d' flag runs them detached mode so that you can continue using your terminal or command prompt for other tasks.
  
  You should now be able to access Jupyter Notebook interface via a web browser at `http://localhost:8888`. Here, ensure the default password is changed if necessary and start interacting with Ollama AI models directly from within notebooks using Python code blocks or shell commands. Be sure that your Docker setup supports GPU acceleration (if desired) for enhanced performance in model processing tasks!
  
This comprehensive set-up will provide an interactive, user friendly experience to explore and leverage the Ollama AI models directly from Jupyter Notebook interface right on a local or remote server. Happy exploring & experimenting with Artificial Intelligence concepts using this setup at your own pace! 
