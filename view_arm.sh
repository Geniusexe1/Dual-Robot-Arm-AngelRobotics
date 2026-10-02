#!/bin/bash
# Open the arm in RViz with joint sliders, after closing any leftover ROS/Gazebo sessions.
# Run from WSL:  bash "/mnt/c/Users/Belal/Desktop/angel robotics/urdf/view_arm.sh"
source /opt/ros/noetic/setup.bash
export ROS_PACKAGE_PATH="/mnt/c/Users/Belal/Desktop/angel robotics/urdf:$ROS_PACKAGE_PATH"

echo "Closing old ROS / Gazebo processes..."
pkill -INT -x roslaunch; sleep 2
for p in gzserver gzclient rviz rosmaster rosout robot_state_publisher joint_state_publisher_gui spawner; do pkill -9 -f "/$p( |$)"; done
pkill -9 -x gzserver; pkill -9 -x gzclient
sleep 1

roslaunch URDF_description display.launch
