#!/bin/bash
docker run -it --rm -v "$PWD":/usr/src/code -w="/usr/src/code" haskell:latest ghci
