#!/usr/bin/env python

import os
import subprocess

excluded_dirs = []
git = {'repo': '.git', 'command': ['git', 'pull']}
hg = {'repo': '.hg', 'command': ["hg", "pull"]}

# Build list of files containing desired file extensions
def search_extensions(root_dir):
    dir_list = []
    repos = {'git': [], 'hg': []}

    for item in os.listdir():
        if (os.path.isdir(item)):
            dir_list.append(item)

        for exclude in excluded_dirs:
            if exclude in dirs:
                dir_list.remove(exclude)

    for directory in dir_list:
        for items in os.listdir(directory):
            if git['repo'] in items:
                repos['git'].append(directory)
                break
            if hg['repo'] in items:
                repos['hg'].append(directory)
                break

    return repos


if __name__ == "__main__":
    root_dir = os.path.dirname(os.path.realpath(__file__))
    repos = search_extensions(root_dir)
    print(repos)
    
    root_dir = os.getcwd()
    for directory in repos['git']:
        os.chdir(directory)
        subprocess.call(git['command'])
        os.chdir(root_dir)

    for directory in repos['hg']:
        os.chdir(directory)
        subprocess.call(hg['command'])
        os.chdir(root_dir)
