#!/bin/sh

# install Catch2
git clone git@github.com:catchorg/Catch2.git
cd Catch2
mkdir build && cd build
cmake ..
make
sudo make install
cd ../..
sudo rm -rf Catch2

# install pybind 11
git clone https://github.com/pybind/pybind11.git
cd pybind11
mkdir build && cd build
cmake .. -DCMAKE_INSTALL_PREFIX=../install/ -DPYBIND11_TEST=Off
sudo make install
cd ../..
sudo rm -rf pybind11

# install autodiff
git clone https://github.com/autodiff/autodiff
cd autodiff
mkdir .build && cd .build
cmake ..
make
sudo make install
cd ../..
sudo rm -rf autodiff

# install ifopt (with ipopt)
sudo apt-get install cmake libeigen3-dev coinor-libipopt-dev
git clone https://github.com/ethz-adrl/ifopt.git && cd ifopt
mkdir build && cd build
cmake ..
make
sudo make install 
cd ../..
sudo rm -rf ifopt

# install dependencies for grid_map_ros2
sudo apt-get install libeigen3-dev
# sudo apt install ros-${ROS_DISTRO}-