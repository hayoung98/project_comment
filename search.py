import requests
from bs4 import BeautifulSoup
import json

url = "https://data.tycg.gov.tw/api/v1/rest/datastore/bd906b29-9006-40ed-8bd7-67597c2577fc?format=json"
r = requests.get(url)
data = json.loads(r.text)
#print((data['result']['records'][0]['Name']))

for index in range(100):
# Google 搜尋 URL
    google_url = 'https://www.google.com.tw/search'

# 查詢參數
    inputname = data['result']['records'][index]['Name']
    j = inputname + '評論'
    my_params = {'q': j}
    r = requests.get(google_url, params = my_params)
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print("景點：",inputname)
# 確認是否下載成功
    if r.status_code == requests.codes.ok:
  # 以 BeautifulSoup 解析 HTML 原始碼
        soup = BeautifulSoup(r.text, 'html.parser')
  #print(soup.prettify())
        items = soup.select('a[href^="/url"]')
        for i in items:
            if(i.get('href')[0:37]=='/url?q=https://www.tripadvisor.com.tw'):
                attraction_url = i.get('href')[7:]
    # 標題
           #print("標題：" + i.text)
    # 網址
                print("網址：" + i.get('href')[7:])


    res = requests.get(attraction_url)
    html_doc = res.text

# 以 Beautiful Soup 解析 HTML 程式碼
    soup = BeautifulSoup(html_doc, 'html.parser')

    # h1_tags = soup.find_all('li', class_="breadcrumb")
    # for h1_tag in h1_tags:
    #     if h1_tag.string is None:
    #         pass
    #     else:
    #         print("您所搜尋的景點為：",inputname)

    label_tags = soup.find_all('label',class_="row_label label",limit=5)
    span_tags = soup.find_all('span',class_="row_num is-shown-at-tablet")
    labellist=[]
    spanlist=[]
    for label_tag in label_tags:
        labellist.append(label_tag.string)
    for span_tag in span_tags:
        spanlist.append(span_tag.string)
    dictionary = dict(zip(labellist, spanlist))
    print("評分: ",end='')
    print(dictionary,"\n")
# for x in dictionary:
#     print(x)
#     for y in dictionary[x]:
#         print(y,end='')


    print("****************評論****************")
    any_tags = soup.find_all('p', class_="partial_entry")
    i=1
    for tag in any_tags:
        comment = tag.string
        if comment is None:
            pass  # 過濾None
        else:
            print(i,".\n",str(comment), "\n")
            i=i+1
    print("****************評論****************")
    any_tags.clear()
print("--------------------------------------------------------------------------------------------------------------------------------")
