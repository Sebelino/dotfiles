#!/usr/bin/env python

import os
import sys

if __name__ == '__main__':
    if len(sys.argv) != 2:
        print("Usage: pad.py <directory>")
        sys.exit(1)

    directory = '.'
    filenames = os.listdir(directory)
    max_filename_length = max(len(name) for name in filenames)
    for name in filenames:
        head = '0' * (max_filename_length - len(name))
        new_name = head + name
        print("mv {} {}".format(name, new_name))
        os.rename(name, new_name)

    print("Done!")
