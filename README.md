# HUSKY UGV simulator CAGED for ease use

## Prerequisites

* [Docker](https://docs.docker.com/engine/install/ubuntu/)
  installed on your system

That's it.

## Setup

Pull docker concainter with simulator in it.

`docker pull kowalskiexe/husky-sim`

## Usage

Place your `robot.yaml` in `clearpath/` directory. It
already contains an example config file.

Start the simulator in a docker container via
`./run-docker.sh` script.

This *should* work out of the box. The script binds the
`clearpath` directory in the repo to `/root/clearpath` on
the container exposing your `robot.yaml` to the simulator.

Also, the container is connected to your computer's network
so any other ROS2 nodes ought to communicate with the
simulator frictionlessly.

## Troubleshooting

### Problems with docker

Probably configuring docker according to this
[guide](https://docs.docker.com/engine/install/linux-postinstall/)
can help.

### `ros2 topic list` freezing

* Try rebooting the simulator.
* Try rebooting your computer.
* If this doesn't help, try running every `ros2 topic` and `ros2 node` commands with
`--no-daemon` flag.

It may have something to do with [this
bug](https://github.com/ros2/ros2cli/issues/610).
