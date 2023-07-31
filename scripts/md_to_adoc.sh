#!/bin/bash

for MD_FILE in $(find ../ -name "*.md"); do
  kramdoc $MD_FILE
done

