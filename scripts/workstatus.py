#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
You need a subdirectory "data" in this directory, where you put a file called
"workstatus.csv". Fill it with comma-separated data. Example:

15,#FFFF00,DENY D C,echo hey >> ~/heyhey
30,#FF0000,,echo hey >> ~/heyhey
"""

import csv
import os
from datetime import datetime
import subprocess
import sys


def readcsv(path):
    with open(path, 'r') as csvfile:
        reader = csv.reader(csvfile)
        contents = list(reader)
        return contents


def barstr(barcount, maxbarcount=None, color="#FFFFFF", message=None):
    """ :returns: <fc=CLR>MSG ▮...▮</fc><fc=#BBBBBB>▯...▯</fc> """
    if maxbarcount is None:
        maxbarcount = barcount
    elif maxbarcount < barcount:
        return "Error: maxbarcount < barcount"
    rbar = "▮"*barcount
    cbar = "▯"*(maxbarcount-barcount)
    msg = "" if message is None else message+" "
    return "<fc={}>{}{}</fc><fc=#BBBBBB>{}</fc>".format(color, msg, rbar, cbar)


def passed_time_widget():
    n = datetime.now()
    diff = n-datetime(2016, 8, 29)
    total_secs = diff.total_seconds()
    bardata = {
        'day': (int(total_secs/24/60/60), None, "#600000"),
        'hour': (int(total_secs/60/60) % 24, None, "#006000"),
        'tenmin': (int(total_secs/60/10) % 6, None, "#0000A0"),
        'min': (int(total_secs/60) % 10, 10, "#808000"),
    }
    bars = {k: barstr(*bardata[k]) for k in bardata}
    widget = ("Time: "+bars['day']+bars['hour']+bars['tenmin']+bars['min'] +
              " {}d {}h {}m".format(bardata['day'][0], bardata['hour'][0],
                                    bardata['tenmin'][0]*10+bardata['min'][0]))
    return widget

if __name__ == '__main__':
    doproc = not (len(sys.argv) >= 2 and sys.argv[1] == 'noproc')
    csvpath = os.path.realpath(
        os.path.join(os.getcwd(),
                     os.path.join(os.path.dirname(__file__),
                                  os.path.join('data', 'workstatus.csv'))))
    contents = readcsv(csvpath)
    entries = [(int(r[0]), r[1], r[2], r[3]) for r in contents]
    cyclemins = int(entries[-1][0])
    n = datetime.now()
    passedmins = n.minute % cyclemins
    lastmin, color, msg, action = [(t, c, m, a) for (t, c, m, a) in entries
                                   if passedmins < t][0]
    minlimits = [0]+[t for (t, _, _, _) in entries]
    startmin = minlimits[minlimits.index(lastmin)-1]
    wstatus = barstr(lastmin-passedmins, lastmin-startmin, color, msg)
    timewidget = passed_time_widget()
    # wakehour = 6
    # sleephour = 24
    # daystatus = barstr(n.hour-wakehour, sleephour-wakehour, "#448800",
    #                    "Day {}:00-{}:00".format(wakehour, sleephour))
    # print(timewidget)
    print("{} | {}".format(wstatus, timewidget))
    if passedmins == startmin and doproc:
        subprocess.Popen(["bash", "-c", action])
