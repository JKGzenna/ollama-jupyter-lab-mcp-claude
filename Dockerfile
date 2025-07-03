# Usamos siempre como base la última imagen oficial de Jupyter.
FROM jupyter/scipy-notebook:latest

LABEL maintainer="Juan Luis Goldaracena Izquierdo <juanlu360@gmail.com>"

# Cambiamos a usuario root para instalar paquetes y dependencias.
USER root

# Instalamos paquetes y dependencias del sistema con usuario root.
RUN apt-get update && apt-get install -y \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Cambiamos de nuevo de al usuario jovyan owner de la imagen Jupyter, y compatible 
# con todas las extensiones comunitarias, no se recomienda usar otro user ni root.
USER jovyan

# Instalamos 'jupyter-collaboration' y otras extensiones necesarias.
RUN pip install --no-cache-dir \
    jupyter-collaboration \
    jupyter-server-ydoc \
    jupyter-server-fileid \
    jupyterlab>=4.0.0 \
    notebook>=7.0.0

# Habilitamos las extensiones de Jupyter necesarias para MCP con Claude.
RUN jupyter server extension enable jupyter_collaboration && \
    jupyter server extension enable jupyter_server_ydoc && \
    jupyter server extension enable jupyter_server_fileid

# Configuramos Jupyter para permitir colaboración y no utilizar token ni password,ya que 
# en PRO colocaremos el proyecto por detrás de un nginx, para terminar de instalar Jupyter
# utilizaremos este comando para configurar el archivo 'jupyter_server_config.py'.
RUN mkdir -p /home/jovyan/.jupyter && \
    echo "c.ServerApp.ip = '0.0.0.0'" >> /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.allow_origin = '*'" >> /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.disable_check_xsrf = True" >> /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.allow_remote_access = True" >> /home/jovyan/.jupyter/jupyter_server_config.py && \
    echo "c.ServerApp.token = ''" >> /home/jovyan/.jupyter/jupyter_server_config.py && \ 
    echo "c.ServerApp.password = ''" >> /home/jovyan/.jupyter/jupyter_server_config.py && \ 
    echo "c.ServerApp.password_required = False" >> /home/jovyan/.jupyter/jupyter_server_config.py

# Exponemos puerto 8888
EXPOSE 8888

# Comando por defecto para arrancar Jupyter Lab en modo colaborativo.
CMD ["jupyter", "lab", "--collaborative", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]