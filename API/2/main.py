from flask import Flask, session, request
import argoscuolanext
import numpy as np
import json

app = Flask(__name__)

# Set the secret key to some random bytes. Keep this really secret!
app.secret_key = b'_5#y2L"F4Q8z\n\xec]/'



def data(session):
    values = ('datGiorno', 'desMateria', 'decValore')
    navigation = argoscuolanext.Session(session['school_code'],
                                        (session['username']),
                                        (session['password']))
    voti = navigation.votigiornalieri()['dati']
    numVoti = len(voti)
    lista_voti = [{} for i in range(numVoti)]
    for i in range(numVoti):
        for key in values:
            lista_voti[i][key] = str(voti[i][key]).replace('\'', '')
    lista_voti = {session['username']:lista_voti}
    return str(lista_voti).replace("'", "\"") #era una stringa, rischio di errore

def algoritmo1(session):
    a_1 = json.loads(data(session))[session['username']]
    materie = session['materie']#["DISEGNO E STORIA DELL ARTE",'FILOSOFIA','FISICA','LATINO','LINGUA INGLESE','MATEMATICA','STORIA','SCIENZE NATURALI','ITALIANO','SCIENZE MOTORIE E SPORTIVE'] #
    #qudrimestre = int(session['quadrimestre'])
    mm3 = session['media']
    cambiamenti = session['preferenze']
    comportamento = session['comportamento']
    educazione_civica = session['educazione_civica']
    if len(materie) == 10:
        medie=[0,0,0,0,0,0,0,0,0,0,comportamento,educazione_civica]
        voti_3={materie[0]:[],materie[1]:[],materie[2]:[],materie[3] :[],materie[4]:[],materie[5]:[],materie[6]:[],materie[7]:[],materie[8]:[],materie[9]:[]} 
    elif len(materie) == 11:
        medie=[0,0,0,0,0,0,0,0,0,0,0,comportamento,educazione_civica]
        voti_3={materie[0]:[],materie[1]:[],materie[2]:[],materie[3] :[],materie[4]:[],materie[5]:[],materie[6]:[],materie[7]:[],materie[8]:[],materie[9]:[],materie[10]:[]} 
    else:
        voti_3={materie[0]:[],materie[1]:[],materie[2]:[],materie[3] :[],materie[4]:[],materie[5]:[],materie[6]:[],materie[7]:[],materie[8]:[],materie[9]:[],materie[10]:[],materie[11]:[]} 
        medie=[0,0,0,0,0,0,0,0,0,0,0,0,comportamento,educazione_civica]    
    
    mi=-1
    c = 0
    L = len(a_1)

    for j in materie:
        for i in range(L):
           # try:
           if a_1[i]['datGiorno'][5] == '0':
                if a_1[i]['datGiorno'][6]=='2' or a_1[i]['datGiorno'][6]=='3' or a_1[i]['datGiorno'][6]=='4' or a_1[i]['datGiorno'][6]=='5' or a_1[i]['datGiorno'][6]=='6':
                    if a_1[i]['desMateria']==j:
                        tru=a_1[i]['decValore']
                        if type(tru) != 'NoneType' and tru !=0.00:
                            voti_3[j].append(tru)
                    else:
                        c+=0
                else:
                    c+=0
           #except:
                # if a_1[i]['desMateria']==j:
                #     tru=a_1[i]['decValore']
                #     if type(tru) != 'NoneType' and tru !=0.00:
                #         voti_3[j].append(tru)
                # else:
                #     c += 0
    
    for k in range(len(materie)):
        print(materie[k])
        mi=mi+1
        m1=voti_3[materie[k]]
        m2 = len(m1)
        m4=0.0
        for m3 in range(m2):
            m4+=float(m1[m3])
        if m2 !=0:
            m5=m4/m2
        else:
            m5 = 10
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
    while media < mm3:
        if cambiamenti[k]=='1':
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
    'numero necessario': lista,}

    risposta = {'voti':voti,'media':media,'df':df,'df_1':df_1 }

    return risposta



@app.route('/', methods=['GET', 'POST'])
def index():

    if request.method == 'POST':
        session['school_code'] = request.form['school_code']
        session['username'] = request.form['username']
        session['password'] = request.form['password']
        session['materie'] = request.form['materie']
        #session['qudrimestre'] = request.form['quadrimestre']
        session['media'] = float(request.form['media'])
        session['preferenze'] = list(request.form['preferenze'])
        session['comportamento'] = int(request.form['comportamento'])
        session['educazione_civica'] = int(request.form['educazione_civica'])

        return algoritmo1(session)
        
    return '''
        <form method="post">
            <p>codice scuola: <input type=text name=school_code>
            <p>username: <input type=text name=username>
            <p>password: <input type=text name=password>
            <p>materie: <input type=text name=materie>

            <p>media: <input type=text name=media>
            <p>preferenze: <input type=text name=preferenze>
            <p>comportamento: <input type=text name=comportamento>
            <p>educazione_civica: <input type=text name=educazione_civica>
            <p><input type=submit value=Login>
        </form>
    '''


#<p>quadrimestre: <input type=text name=quadrimestre>