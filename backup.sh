#!/bin/bash

mkdir backup

cp "$HOME"/*.conf "$HOME"/*.config "$HOME"/backup

cp "$HOME"/backup/* "$HOME"
