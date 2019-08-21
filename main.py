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

    Name_list = []
    Toldescribe_list = []
    Add_list = []
    Parkinginfo_list = []
    Tel_list = []
    Opentime_list = []
    Px_list = []
    Py_list = []

    f = codecs.open("./File/Name.txt", 'w', 'utf-8')
    for i in range(100):
        newname = data['result']['records'][i]['Name']
        Name_list.append(newname)
        Toldescribe_list.append(data['result']['records'][i]['Toldescribe'])
        Add_list.append(data['result']['records'][i]['Add'])
        Parkinginfo_list.append(data['result']['records'][i]['Parkinginfo'])
        Tel_list.append(data['result']['records'][i]['Tel'])
        Opentime_list.append(data['result']['records'][i]['Opentime'])
        Px_list.append(data['result']['records'][i]['Px'])
        Py_list.append(data['result']['records'][i]['Py'])
        f.write(newname)
        f.write("\r\n")
    f.close()

    data = {'Name': Name_list, 'Toldescribe': Toldescribe_list, 'Add': Add_list, 'Parkinginfo': Parkinginfo_list,
            'Tel': Tel_list, 'Opentime': Opentime_list, 'Px': Px_list, 'Py': Py_list}
    df = DataFrame(data)
    df.to_excel('new.xlsx', sheet_name='sheet1')

    UVI_url = "http://opendata.epa.gov.tw/webapi/Data/UV/?$orderby=PublishTime%20desc&$skip=0&$top=1000&format=json"
    uvi_r = requests.get(UVI_url)
    uvi_data = json.loads(uvi_r.text)
    uvi_f = open("./File/UVI.txt", 'w')
    uvi_f.write(uvi_data[2]['UVI'])
    uvi_f.close()

    Weather_url = "https://www.cwb.gov.tw/V7/forecast/taiwan/Taoyuan_City.htm"
    Weather_res = requests.get(Weather_url)
    Weather_res.encoding = 'utf-8'
    html_doc = Weather_res.text

    soup = BeautifulSoup(html_doc, 'html.parser')
    tbody_tags = soup.find_all('td', limit=12)
    Weather_f = codecs.open('./File/Weather.txt', 'w', 'utf-8')

    for tbody_tag in tbody_tags:
        if tbody_tag.string is None:
            pass
        else:
            Weather_f.write(tbody_tag.string)
            Weather_f.write('\r\n')
    Weather_f.close()


def search():
    search_f = codecs.open('./File/search_result.txt', 'w', 'utf-8')
    search_ff = open('./File/search_result2.txt', 'w')
    read = pd.read_excel('new.xlsx')
    read2 = pd.read_excel('排名.xlsx')
    # print("長度",read2.shape[0])
    read2_len = read2.shape[0]
    for i in range(100):
        if sys.argv[2] == read.iloc[i, 1]:
            for j in range(2, 9):
                search_f.writelines(str(read.iloc[i, j]))
                search_f.write("\r\n")
            now_weather_search(str(read.iloc[i, 7]), str(read.iloc[i, 8]))
    for j in range(read2_len):
        if sys.argv[2] == read2.iloc[j, 1]:
            # print(read2.iloc[i,1])
            for k in range(2, 4):
                search_ff.writelines(str(read2.iloc[j, k]))
                search_ff.write("\n")
    search_f.close()
    search_ff.close()


def now_weather_search(X, Y):
    now_weather_url = "https://weather.com/zh-TW/weather/today/l/" + Y + "," + X + "?par=apple_widget&locale=zh_TW"
    # print(now_weather_url)
    now_weather_res = requests.get(now_weather_url)
    now_weather_html_doc = now_weather_res.text

    # 以 Beautiful Soup 解析 HTML 程式碼
    now_weather_f = codecs.open('./File/nowweather.txt', 'w', 'utf-8')
    soup = BeautifulSoup(now_weather_html_doc, 'html.parser')
    div_tags = soup.find('div', class_="today_nowcard-temp")
    span_tags = div_tags.find('span', class_="")
    for i in span_tags:
        # 現在溫度
        # print(int(i))
        now_weather_f.writelines(i.string)
        now_weather_f.write("\r\n")
        break

    div_tags = soup.find('div', class_="today_nowcard-phrase")
    for j in div_tags:
        # 現在天氣狀態(中文敘述)
        # print(j.string)
        now_weather_f.writelines(j.string)
        now_weather_f.write("\r\n")

    div_tags = soup.find('div', class_="today_nowcard-hilo")
    div2_tags = div_tags.find('div')
    span_tags = div2_tags.find_all('span', class_="")
    for k in span_tags:
        # 現在紫外線
        # print(k.string)
        now_weather_f.writelines(k.string)
        now_weather_f.write("\r\n")
    now_weather_f.close()


if __name__ == "__main__":
    eval(sys.argv[1])
