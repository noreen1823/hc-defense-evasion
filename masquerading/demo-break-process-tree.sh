#!/usr/bin/env bash

function_to_escape() {
  echo "inside fork, waiting 120s"
  sleep 120
  echo "fork 1 waited for 120s"
}

function_to_escape & echo "Stared fork with PID " $!
echo "Main waiting for 20s"
sleep 20
echo "Main finished, exiting..."
