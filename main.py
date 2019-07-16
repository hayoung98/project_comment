import requests
from bs4 import BeautifulSoup

res = requests.get('https://www.tripadvisor.com.tw/Attraction_Review-g13806457-d6553566-Reviews-Daxi_Old_Street-Daxi_Taoyuan.html')
html_doc = res.text

# 以 Beautiful Soup 解析 HTML 程式碼
soup = BeautifulSoup(html_doc, 'html.parser')
any_tags = soup.find_all('p',class_="partial_entry")
for tag in any_tags:
    if tag.string is None:
        pass #過濾
    else:
        print(tag.string,"\n")

