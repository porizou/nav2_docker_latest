

# Usage

```bash
docker build -t ros2_nav2:iron .
```


```bash
xhost +local:docker
docker run -it --env="DISPLAY" --env="QT_X11_NO_MITSHM=1" --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" --name nav2_latest ros2_nav2:iron
```



## Run Example

```bash
ros2 launch nav2_bringup tb3_simulation_launch.py headless:=False
```