#!/bin/bash

NAME='[Bug] Привет от меня [bug]'
Title='jj'
echo Title=$NAME | sed 's/ //g; s/\[bug\]//; s/\[Bug\]//; s/\[BUG\]//'
TITLE_LENGTH=${#Title}
echo $TITLE_LENGTH