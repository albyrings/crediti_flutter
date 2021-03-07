from flask import Flask, session, request
import argoscuolanext

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
    return str(lista_voti).replace("'", "\"")


@app.route('/', methods=['GET', 'POST'])
def index():

    if request.method == 'POST':
        session['school_code'] = request.form['school_code']
        session['username'] = request.form['username']
        session['password'] = request.form['password']
        return data(session)
    return '''
        <form method="post">
            <p>codice scuola: <input type=text name=school_code>
            <p>username: <input type=text name=username>
            <p>password: <input type=text name=password>
            <p><input type=submit value=Login>
        </form>
    '''


