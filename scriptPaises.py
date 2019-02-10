#Para cada review, acede ao perfil do utilizador e extrai o seu país. Atualiza o csv das reviews, 5000 linhas de cada vez.


from bs4 import BeautifulSoup
import pandas as pd
import urllib.request

df = pd.read_csv("reviews.csv")
df['location'] = ''

df1 = df.iloc[:,:5000]
df2 = df.iloc[:,5000:]
iterat = 0

for id, row in df.iterrows():
    
    try:
        url = "https://www.airbnb.pt/users/show/" + str(row['reviewer_id'])
        page=urllib.request.Request(url,headers={'User-Agent': 'Mozilla/5.0'}) 
        infile=urllib.request.urlopen(page).read()
        data = infile.decode('UTF-8')
        soup = BeautifulSoup(data, 'html.parser')
        country_div = soup.find('div', attrs={'class': 'h5 space-top-2'})
        country = country_div.find('a', attrs={'class' : 'link-reset'})

        textsplitted = country.text.split(", ")
        location = textsplitted.pop()
        df1.at[id,'location'] = location
        print(location + " " + str(id))                 
    except:
        print("EXCEPTION!")  
        
        
    olditerat = iterat
    iterat = id // 5000    
    if (iterat > olditerat):
        df1.to_csv("output" + str(iterat) + ".csv")
        df1 = df2.iloc[:, :5000]
        df2 = df2.iloc[:, 5000:]    
        