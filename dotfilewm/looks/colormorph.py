#!/usr/bin/env python3
"""
This is a simple python script to turn an array of colors into each other. It morphs the last color into the first,
so it can be used continuously without any jerkiness. I use it to change border colors. Use it as you want.
"""
import sys
import fileinput
import argparse

def main(colors, res):
    index = 0
    while index < len(colors) - 1:
        curr = colors[index]
        nextcol= colors[index+1]
        get_col_range(curr, nextcol, res)
        index += 1
    get_col_range(colors[-1], colors[0], res)
def get_col_range(curr, nextcol, res):
        if curr[0] == "#":
            curr = curr[1:]
        R1 = int(curr[0:2],16)
        G1 = int(curr[2:4],16)
        B1 = int(curr[4:6],16)
        if nextcol[0] == "#":
            nextcol = nextcol[1:]
        R2 = int(nextcol[0:2],16)
        G2 = int(nextcol[2:4],16)
        B2 = int(nextcol[4:6],16)
        stepR = (R2 - R1)/res
        stepG = (G2 - G1)/res
        stepB = (B2 - B1)/res
        currR = R1
        currG = G1
        currB = B1
        for _ in range(res):
            R = hex(int(currR))[2:]
            G = hex(int(currG))[2:]
            B = hex(int(currB))[2:]
            while len(R) < 2:
                R = "0"+R
            while len(G) < 2:
                G = "0"+G
            while len(B) < 2:
                B = "0"+B
            print(R+G+B)
            #print(hex(int(currR/1))[2:] + hex(int(currG/1))[2:] + hex(int(currB/1))[2:])
            currR += stepR
            currG += stepG
            currB += stepB

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='opts')
    parser.add_argument(dest='res', metavar='r', type=int, nargs='?', default=20, help='number of output colors generated per input color')
    parser.add_argument(dest='colors', nargs='+', help='list of colors to form the sequence.')
    args = parser.parse_args()
    colors = []
    for line in args.colors:
        colors.append(line)
    main(colors, args.res)
