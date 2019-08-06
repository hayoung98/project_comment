import sys
import requests
from bs4 import BeautifulSoup
import json
from pandas import DataFrame
import pandas as pd
import codecs


def createfile():

	url = "https://data.tycg.gov.tw/api/v1/rest/datastore/bd906b29-9006-40ed-8bd7-67597c2577fc?format=json"
	r = requests.get(url)
	data = json.loads(r.text)

	Name_list=[]
	Toldescribe_list=[]
	Add_list=[]
	Parkinginfo_list=[]
	Tel_list=[]
	Opentime_list=[]

	f = codecs.open("./File/Name.txt",'w','utf-8')
	for i in range(100):
		newname = data['result']['records'][i]['Name']
		Name_list.append(newname)
		Toldescribe_list.append(data['result']['records'][i]['Toldescribe'])
		Add_list.append(data['result']['records'][i]['Add'])
		Parkinginfo_list.append(data['result']['records'][i]['Parkinginfo'])
		Tel_list.append(data['result']['records'][i]['Tel'])
		Opentime_list.append(data['result']['records'][i]['Opentime'])
		f.write(newname)
		f.write("\r\n")
	f.close()

	data={'Name':Name_list,'Toldescribe':Toldescribe_list,'Add':Add_list,'Parkinginfo':Parkinginfo_list,'Tel':Tel_list,'Opentime':Opentime_list}
	df=DataFrame(data)
	df.to_excel('new.xlsx',sheet_name='sheet1')


	UVI_url = "http://opendata.epa.gov.tw/webapi/Data/UV/?$orderby=PublishTime%20desc&$skip=0&$top=1000&format=json"
	uvi_r = requests.get(UVI_url)
	uvi_data = json.loads(uvi_r.text)
	uvi_f = open("./File/UVI.txt",'w')
	uvi_f.write(uvi_data[2]['UVI'])
	uvi_f.close()



	Weather_url = "https://www.cwb.gov.tw/V7/forecast/taiwan/Taoyuan_City.htm"
	Weather_res = requests.get(Weather_url)
	Weather_res.encoding = 'utf-8'
	html_doc = Weather_res.text

	soup = BeautifulSoup(html_doc, 'html.parser')
	tbody_tags = soup.find_all('td', limit=12)
	Weather_f = codecs.open('./File/Weather.txt', 'w','utf-8')

	for tbody_tag in tbody_tags:
		if tbody_tag.string is None:
			pass
		else:
			Weather_f.write(tbody_tag.string)
			Weather_f.write('\r\n')
	Weather_f.close()

def search():
	search_f = codecs.open('./File/search_result.txt','w','utf-8')
	read = pd.read_excel('new.xlsx')
	for i in range(100):		
		if sys.argv[2] == read.iloc[i,1]:
			for j in range(2,7):
				search_f.writelines(read.iloc[i,j])
				search_f.write("\r\n")
	search_f.close()

if __name__ == "__main__":
	eval(sys.argv[1])