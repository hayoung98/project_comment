import requests
from bs4 import BeautifulSoup
import json
from pandas import DataFrame
import pandas as pd
import codecs


url = "https://data.tycg.gov.tw/api/v1/rest/datastore/bd906b29-9006-40ed-8bd7-67597c2577fc?format=json"
r = requests.get(url)
data = json.loads(r.text)
# 存入excel的list
attraction_name_list = []
hot_list=[]
score_list=[]

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

    if bool(dictionary) == False:
        pass
    else:
        print(index,"/100")
        great_count = int(dictionary.get("很棒"))
        verygood_count = int(dictionary.get("非常好"))
        good_count = int(dictionary.get("一般"))
        poor_count = int(dictionary.get("差"))
        terrible_count = int(dictionary.get("糟透了"))

        hot = great_count+verygood_count
        score = (great_count*5 + verygood_count*4 + good_count*3+poor_count*2+terrible_count*1)/(great_count+verygood_count+good_count+poor_count+terrible_count)

        attraction_name_list.append(inputname)
        hot_list.append(hot)
        score_list.append(round(score,2))

data={'景點名稱':attraction_name_list,'人氣':hot_list,'評分':score_list}
df=DataFrame(data)
df.to_excel('排名.xlsx')

read = pd.read_excel('排名.xlsx',index_col=0)

resort_hot = read.sort_values(by=['人氣'], ascending=False)
hot_f = codecs.open('./File/sort_hot.txt','w','utf-8')
hot_ff = open('./File/hot.txt','w')
mainhot_score_f = open('./File/mainhot_score.txt','w')
for i in range(10):
    hot_f.write(resort_hot.iloc[i,0])
    hot_f.write("\r\n")
    hot_ff.write(str(resort_hot.iloc[i, 1]))
    hot_ff.write("\n")
    mainhot_score_f.write(str(resort_hot.iloc[i, 2]))
    mainhot_score_f.write("\n")
hot_f.close()
hot_ff.close()
mainhot_score_f.close()


resort_score = read.sort_values(by=['評分'], ascending=False)
score_f = codecs.open('./File/sort_score.txt','w','utf-8')
score_ff = open('./File/score.txt','w')
mainscore_hot_f = open('./File/mainscore_hot.txt','w')
for j in range(10):
    score_f.write(resort_score.iloc[j,0])
    score_f.write("\r\n")
    score_ff.write(str(resort_score.iloc[j, 2]))
    score_ff.write("\n")
    mainscore_hot_f.write(str(resort_score.iloc[j, 1]))
    mainscore_hot_f.write("\n")
score_f.close()
score_ff.close()
mainscore_hot_f.close()
