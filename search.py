import requests
from bs4 import BeautifulSoup

# Google 搜尋 URL
google_url = 'https://www.google.com.tw/search'

# 查詢參數q
inputname = input('請輸入景點：')
j = inputname + '評論'
my_params = {'q': j}
r = requests.get(google_url, params = my_params)
# 確認是否下載成功
if r.status_code == requests.codes.ok:
  # 以 BeautifulSoup 解析 HTML 原始碼
    soup = BeautifulSoup(r.text, 'html.parser')
  #print(soup.prettify())
    items = soup.select('a[href^="/url"]')
    for i in items:
        if(i.get('href')[0:55]=='/url?q=https://www.tripadvisor.com.tw/Attraction_Review'):
            attraction_url = i.get('href')[7:]
    # 標題
           #print("標題：" + i.text)
    # 網址
           #print("網址：" + i.get('href')[7:])

res = requests.get(attraction_url)
html_doc = res.text

# 以 Beautiful Soup 解析 HTML 程式碼
soup = BeautifulSoup(html_doc, 'html.parser')
f = open('comment.txt', 'w')

h1_tags = soup.find_all('li', class_="breadcrumb")
for h1_tag in h1_tags:
    if h1_tag.string is None:
        pass
    else:
        print("您所搜尋的景點為：",h1_tag.string,"\n")

any_tags = soup.find_all('p', class_="partial_entry")
i=1
for tag in any_tags:
    comment = tag.string
    if comment is None:
        pass  # 過濾None
    else:
        print(i,".\n",str(comment), "\n")
        i=i+1

f.close()
