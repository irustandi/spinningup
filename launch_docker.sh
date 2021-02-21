#!/bin/bash

docker run --name spinningup --gpus all --ipc=host -t --tty --interactive --network host spinningup
