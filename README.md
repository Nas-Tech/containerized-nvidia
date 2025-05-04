# Containerized Nvidia with CUDA 12.8.1

This repository aims to provide and easily runnable containerized Nvidia environment with the CUDA toolkit installed. The `nvcc` compiler is available, and the `nvvp` (Nvidia visual profiler) can be used alongside an X11 server running on the host for GUI forwarding.

## Requirements

- CUDA 12.8.1 capable Nvidia GPU
- X11 server running on the host (if visual profiler is to be run with the GUI)
- Docker

## How to use

1. Start the X11 server on the host to enable GUI forwarding:
  
    ```
    xhost +
    ```

2. Create a workspace to bind mount:

    ```
    mkdir workspace
    ```

    **If a different directory name is used, edit the docker compose file appropriately**

3. Start the container:

    ```
    docker compose up -d
    ```

    **This step may take some time since the cuda-toolkit installation could take a while**

After the container is running, entering the container, one can use `nvcc` and `nvvp` to execute CUDA programs on the GPU.
