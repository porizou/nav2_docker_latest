# ベースイメージとしてosrf/ros2:develを使用
FROM althack/ros2:humble-full-2023-10-01

# メンテナ情報
LABEL maintainer="your-email@example.com"

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    terminator \
    tmux \
    net-tools \
    git \
    python3-colcon-common-extensions \
    python3-vcstool

WORKDIR /ros2_ws/src

# Navigation2のリポジトリをクローン
RUN git clone --branch main https://github.com/ros-planning/navigation2.git

# 依存関係のインストール
RUN cd ../ && \
rosdep update && \
rosdep install --from-paths . --ignore-src -y

# # ビルド
WORKDIR /ros2_ws
RUN . /opt/ros/humble/setup.sh && \
colcon build

# 環境変数の設定
RUN echo 'source /ros2_ws/install/setup.bash' >> ~/.bashrc

# ターミナルを起動するための設定
CMD ["bash"]
