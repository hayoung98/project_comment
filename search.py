import requests
from bs4 import BeautifulSoup

# Google 搜尋 URL
google_url = 'https://www.google.com.tw/search'

# 查詢參數
place=['虎頭山評論','石門水庫評論','永安漁港評論','竹圍漁港評論','大溪老街評論']
for j in place:
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

    # 標題
         print("標題：" + i.text)
    # 網址
         print("網址：" + i.get('href')[7:])

