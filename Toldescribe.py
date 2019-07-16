# -*- coding: utf-8 -*-
import sys
sys.path.append(r'C:\Program Files\IronPython 2.7')
sys.path.append(r'C:\Program Files\IronPython 2.7\Lib')
sys.path.append(r'C:\Program Files\IronPython 2.7\Lib\urllib.py')
sys.path.append(r'C:\Program Files\IronPython 2.7\Lib\ssl.py')
sys.path.append(r'C:\Program Files\IronPython 2.7\Lib\json')
import urllib
import json

url = "https://data.tycg.gov.tw/api/v1/rest/datastore/bd906b29-9006-40ed-8bd7-67597c2577fc?format=json"
response = urllib.urlopen(url)

data = json.loads(response.read())

f = open("C:\\Users\\Administrator\\Desktop\\比賽\比賽終極版\\WebApplication2\\File\\Toldescribe.txt",'w')
newname = data['result']['records'][index]['Toldescribe']
f.write(newname)
f.close()

f_add = open("C:\\Users\\Administrator\\Desktop\\比賽\比賽終極版\\WebApplication2\\File\\Add.txt",'w')
addname = data['result']['records'][index]['Add']
f_add.write(addname)
f_add.close()

f_Parkinginfo = open("C:\\Users\\Administrator\\Desktop\\比賽\比賽終極版\\WebApplication2\\File\\Parkinginfo.txt",'w')
Parkinginfoname = data['result']['records'][index]['Parkinginfo']
f_Parkinginfo.write(Parkinginfoname)
f_Parkinginfo.close()

f_Tel = open("C:\\Users\\Administrator\\Desktop\\比賽\比賽終極版\\WebApplication2\\File\\Tel.txt",'w')
Telname = data['result']['records'][index]['Tel']
f_Tel.write(Telname)
f_Tel.close()

f_Opentime = open("C:\\Users\\Administrator\\Desktop\\比賽\比賽終極版\\WebApplication2\\File\\Opentime.txt",'w')
Opentimename = data['result']['records'][index]['Opentime']
f_Opentime.write(Opentimename)
f_Opentime.close()

UVI_url = "http://opendata.epa.gov.tw/webapi/Data/UV/?$orderby=PublishTime%20desc&$skip=0&$top=1000&format=json"
UVI_response = urllib.urlopen(UVI_url)
UVI_data = json.loads(UVI_response.read())

UVI_f = open("C:\\Users\\Administrator\\Desktop\\比賽\比賽終極版\\WebApplication2\\File\\UVI.txt",'w')
UVI_newname = UVI_data[2]['UVI']
UVI_f.write(UVI_newname)
UVI_f.close()
