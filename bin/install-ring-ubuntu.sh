#! /usr/bin/env bash


sudo sh -c "echo 'deb https://dl.ring.cx/ring-nightly/ubuntu_16.04/ ring main' > /etc/apt/sources.list.d/ring-nightly-main.list"
sudo apt-key adv --keyserver pgp.mit.edu --recv-keys A295D773307D25A33AE72F2F64CD5FA175348F84
sudo add-apt-repository universe
sudo apt-get update && sudo apt-get install ring
