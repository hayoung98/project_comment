import requests
from bs4 import BeautifulSoup
import json

url = "https://data.tycg.gov.tw/api/v1/rest/datastore/bd906b29-9006-40ed-8bd7-67597c2577fc?format=json"
r = requests.get(url)
data = json.loads(r.text)

for index in range(100):
# Google 搜尋 URL
    google_url = 'https://www.google.com.tw/search'

# 查詢參數
    inputname = data['result']['records'][index]['Name']
    j = inputname + ' Attraction_Review'
    my_params = {'q': j}
    r = requests.get(google_url, params = my_params)

# 確認是否下載成功
    if r.status_code == requests.codes.ok:
        soup = BeautifulSoup(r.text, 'html.parser')
        items = soup.select('a[href^="/url"]')
        attraction_url = ''
        for i in items:
            if(i.get('href')[0:55]=='/url?q=https://www.tripadvisor.com.tw/Attraction_Review'):
                attraction_url = i.get('href')[7:]

    if len(attraction_url)==0:
        continue
    print("--------------------------------------------------------------------------------------------------------------------------------")
    print("景點：", inputname)
    print("網址：" + attraction_url)
    res = requests.get(attraction_url)
    html_doc = res.text

# 以 Beautiful Soup 解析 HTML 程式碼
    soup = BeautifulSoup(html_doc, 'html.parser')

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

    if bool(dictionary) == False:
        print('目前尚無評分')
    else:
        print(dictionary,"\n")

    print("****************評論****************")
    any_tags = soup.find_all('p', class_="partial_entry")
    i=1
    for tag in any_tags:
        comment = tag.string
        if (len(attraction_url)==0) or (comment is None):
            pass  # 過濾None
        else:
            print(i,".\n",str(comment), "\n")
            i=i+1
    any_tags.clear()

print("--------------------------------------------------------------------------------------------------------------------------------")
