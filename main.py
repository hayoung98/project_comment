import requests
from bs4 import BeautifulSoup

res = requests.get('https://www.tripadvisor.com.tw/Attraction_Review-g13806457-d6553566-Reviews-Daxi_Old_Street-Daxi_Taoyuan.html')
html_doc = res.text

# 以 Beautiful Soup 解析 HTML 程式碼
soup = BeautifulSoup(html_doc, 'html.parser')
f = open('comment.txt','w')

h1_tags = soup.find_all('li',class_="breadcrumb")
for h1_tag in h1_tags:
    if h1_tag.string is None:
        pass
    else:
        print(h1_tag.string)
        f.write(h1_tag.string)

any_tags = soup.find_all('p',class_="partial_entry")
for tag in any_tags:
    comment = tag.string
    if comment is None:
        pass #過濾
    else:
        print(str(comment),"\n")
        f.write(comment)
        f.write("\n")

f.close()


