#!/bin/bash
#############################
#  2d-200-Random-matrix.sh  #
##########################################################################################
 
# DESCRIPTION:
# Create a randomized 2D array (8x25)
#
# ATTRIBUTION:
# h8rt3rmin8r
# Email: 161803398@email.tg
# PGP: https://h8rt3rmin8r.com
#
# SOURCE URL:
# https://pastebin.com/raw/kvMRHWLC
 
##########################################################################################
 
echo '-----------------------------------------------------------------------------------'
 
declare -A matrix
num_rows=8
num_columns=25
 
for ((i=1;i<=num_rows;i++)) do
    for ((j=1;j<=num_columns;j++)) do
        matrix[$i,$j]=$RANDOM
    done
done
 
f1="%$((${#num_rows}+1))s"
f2=" %9s"
 
printf "$f1" ''
for ((i=1;i<=num_rows;i++)) do
    printf "$f2" $i
done
echo
 
for ((j=1;j<=num_columns;j++)) do
    printf "$f1" $j
    for ((i=1;i<=num_rows;i++)) do
        printf "$f2" ${matrix[$i,$j]}
    done
    echo
done
 
echo '-----------------------------------------------------------------------------------'
 
##########################################################################################
