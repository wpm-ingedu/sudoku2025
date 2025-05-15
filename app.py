from flask import Flask, request, jsonify
from flask_cors import CORS
import psycopg2
import algoritmo as objeto

app = Flask(__name__)
CORS(app)  # Permite recibir solicitudes del frontend (CORS)
# Conexión a PostgreSQL
conn = psycopg2.connect(
    dbname="sudokubd",
    user="palliroot",
    password="gXZsGs984tjbX8tK6PbidKiapdJuJ5DF",
    host="dpg-d0iiggjuibrs739cj450-a",
    port="5432"
)
#Recibe datos del Fronted
@app.route('/api/nuevoEstudiante', methods=['POST'])
def crear_estudiante():
    s=['Masculino','Femenino']
    g=['Primero','Segundo','Tercero','Cuarto','Quinto']
    sec=['A','B','C','D','E','F','G','H','I']
    data = request.get_json()  
    nombre = data['nombre']
    email = data['email'] 
    fn = data['fn'] 
    sexo =s[int(data['sexo'])]
    grado=g[int(data['grado']) ]
    seccion =sec[int(data['seccion']) ]     
    cur = conn.cursor()
    cur.execute("INSERT INTO estudiantes (nombre, email, fecha_nacimiento,sexo,grado,seccion) VALUES (%s, %s, %s, %s, %s, %s) RETURNING id;", (nombre, email,fn,sexo,grado,seccion))
    clave = cur.fetchone()[0]
    conn.commit()
    cur.close()    
    return jsonify({"id": clave, "nombre": nombre, "email": email,"fecha_nacimiento": fn,"sexo": sexo, "grado":grado, "seccion":seccion})

#Envia datos al Fronted
@app.route('/api/mostrarEstudiantes', methods=['GET'])
def obtener_estudiantes():
    cur = conn.cursor()
    cur.execute("SELECT nombre,grado,seccion,sexo FROM estudiantes;") 
    filas = cur.fetchall()
    cur.close()    
    # Convertir a lista de diccionarios
    estudiantes = [{"nombre": f[0],"grado":f[1],"seccion":f[2],"sexo":f[3]} for f in filas]    
    return jsonify(estudiantes)

@app.route("/api/loginJuego", methods=['POST'])
def login():
    data = request.get_json()  
    email = data['email']
    nivel = data['nivel']
    cur = conn.cursor()
    cur.execute(f"SELECT nombre,email,grado,id FROM estudiantes WHERE email = '{email}'")                
    user = cur.fetchone()
    cur.close()    
    sudoku=objeto.Juego(int(nivel))
    tablero=sudoku.sudo
    resultado=sudoku.armado   
    level=['Muy facil','Facil','Intermedio','Dificil','Avanzado'] 
    nivel_juego=level[int(nivel)]
    if user:
        id=user[3]
        cur = conn.cursor()
        sql=f"""SELECT e.id, e.nombre, p.nivel_juego,p.tiempo,p.fecha_juego,p.fallas,p.puntaje
                FROM estudiantes e
                JOIN participacion_sudoku p
                ON e.id = p.estudiante_id
                where e.id={id}"""
        
        cur.execute(sql) 
        filas = cur.fetchall()
        cur.close() 
        estudiantes=[{"id": f[0],"nombre":f[1],"nivel":f[2],"tiempo":str(f[3]),"fecha":f[4],"errado":f[5],"puntos":f[6]} for f in filas]
        #estudiantes ="aa"# [{"nombre": f[0],"grado":f[1],"seccion":f[2],"sexo":f[3]} for f in filas]
        mensaje=f'Bienvenido al juego {nivel_juego}: {user[0]} de {user[2]} grado'
        return jsonify({"mensaje": mensaje,"tablero":tablero,"resultado":resultado,"item":user[3],"participacion":estudiantes})
    else:
        mensaje=f' Usted no se registro {email}'
        return jsonify({"mensaje": mensaje})
        
#Recibe datos del Fronted
@app.route('/api/participacion', methods=['POST'])
def registra_participacion():
    dato = request.get_json()  
    niveles=["Muy facil","Facil","Intermedio","Dificil","Avanzado"]
    id_estudiante=dato['estudiante']
    n=int(dato['nivel'])
    nivel=niveles[n]
    armado=dato['sudoku']
    solucion=dato['resultado']
    tiempo=dato['tiempo'] 
    fallas=dato['fallas']
    puntaje=round(dato['puntaje'],2)
    
    cur = conn.cursor()
    cur.execute("INSERT INTO participacion_sudoku (estudiante_id, nivel_juego, armado_juego,solucion_juego,tiempo,fallas,puntaje) VALUES (%s, %s, %s, %s, %s,%s,%s) RETURNING id;", (id_estudiante, nivel,armado,solucion,tiempo,fallas,puntaje))
    clave = cur.fetchone()[0]
    conn.commit()
    cur.close()    
    return jsonify({"id": id_estudiante, "tiempo": tiempo,"mensaje":"exitoso"})

if __name__ == '__main__':
    app.run(debug=True)
