#rifai il login e metti il json
materie = this.materie
qudrimestre = this.quadrimestre
if len(materie) == 10:
  voti_3={materie[0]:[],materie[1]:[],materie[2]:[],materie[3] :[],materie[4]:[],materie[5]:[],materie[6]:[],materie[7]:[],materie[8]:[],materie[9]:[]} 
elif len(materie) == 11:
  voti_3={materie[0]:[],materie[1]:[],materie[2]:[],materie[3] :[],materie[4]:[],materie[5]:[],materie[6]:[],materie[7]:[],materie[8]:[],materie[9]:[],materie[10]:[]} 
else:
  voti_3={materie[0]:[],materie[1]:[],materie[2]:[],materie[3] :[],materie[4]:[],materie[5]:[],materie[6]:[],materie[7]:[],materie[8]:[],materie[9]:[],materie[10]:[],materie[11]:[]} 
mmm3 = this.media
cambiamenti = this.preferenze
comportamento = this.comportamento
educazione_civica = this.educazione_civica
medie=[0,0,0,0,0,0,0,0,0,0,comportamento,educazione_civica]
mi=-1



a_1=a[this.username]

for j in materie:
  for i in range(L):
  if quadrimestre == 2:
    if a_1[i]['datGiorno'][5]=='0':
      if a_1[i]['datGiorno'][6]=='2' or a_1[i]['datGiorno'][6]=='3' or a_1[i]['datGiorno'][6]=='4' or a_1[i]['datGiorno'][6]=='5' or a_1[i]['datGiorno'][6]=='6':
        if a_1[i]['desMateria']==j:
          tru=a_1[i]['decValore']
          if type(tru) != 'NoneType' and tru !=0.00:
            voti_3[j].append(tru)
          else:
            c+=0
        else:
          c+=0
       elif quadrimestre == 1:
         if a_1[i]['desMateria']==j:
            tru=a_1[i]['decValore']
            if type(tru) != 'NoneType' and tru !=0.00:
              voti_3[j].append(tru)
        else:
        c += 0



#calcola i voti
for j in materie:
  mi=mi+1
  m1=voti_3[j]
  m2 = len(m1)
  m4=0
  for m3 in range(m2):
    m4+=m1[m3]
  if m2 !=0:
    m5=m4/m2
  medie[mi]=int(round(m5,0))



a=[]
b=[]
c=[]
k=0
n6=0
n7=0
n8=0
n9=0
n10=0
n61=0
n71=0
n81=0
n91=0
n101=0
voti=medie
v2=medie


media=np.mean(voti)
while media < mmm3:
  if cambiamenti[k]==1:
    voti[k]=voti[k]+1
  media=np.mean(voti)
  k=k+1
  

df = {'materie': materie, 
'voti necessari': voti,

}


for i in range(len(voti)):
  if voti[i]==6:
    n6=n6+1
  elif voti[i]==7:
    n7=n7+1
  elif voti[i]==8:
    n8=n8+1
  elif voti[i]==9:
    n9=n9+1  
  elif voti[i]==10:
    n10=n10+1
lista=[n6,n7,n8,n9,n10]



df_1={'voti':['6','7','8','9','10'] ,
'numero necessario': lista,

}

  
get{'voti':voti,'media':media,'df':df,'df_1':df_1}
