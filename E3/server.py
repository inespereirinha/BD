#!/usr/bin/python3

from flask import Flask
from flask import render_template, request

## Libs postgres
import psycopg2
import psycopg2.extras

app = Flask(__name__)

## SGBD configs
DB_HOST="db.tecnico.ulisboa.pt"
DB_USER="ist196848" 
DB_DATABASE=DB_USER
DB_PASSWORD="mutz6626"
DB_CONNECTION_STRING = "host=%s dbname=%s user=%s password=%s" % (DB_HOST, DB_DATABASE, DB_USER, DB_PASSWORD)

queries = [
  "INSERT INTO Categoria VALUES (%s);",
  "DELETE FROM Categoria WHERE nome = %s;",
  "INSERT INTO Retalhista VALUES (%s, %s)",
  "DELETE FROM Responsavel_por WHERE tin = %s; \
   DELETE FROM Evento_reposicao WHERE tin = %s; \
   DELETE FROM Retalhista WHERE tin = %s",
  "SELECT cat AS Categoria, unidades, instante FROM Evento_reposicao NATURAL JOIN Produto WHERE num_serie = %d ORDER BY instante GROUP BY cat;",
  "SELECT categoria FROM Tem_outra WHERE super_categoria = %s"
]


## Runs the function once the root page is requested.
## The request comes with the folder structure setting ~/web as the root
@app.route('/')
def init():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    return render_template("index.html", cursor=cursor)
  except Exception as e:
    return str(e) #Renders a page with the error.
  finally:
    cursor.close()
    dbConn.close()
    

@app.route('/inserirCategoria', methods=["POST"])
def inserir_categoria():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cursor.execute(queries[0], (request.form["categoria_nome"],))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return str(e) 
  finally:
    cursor.close()
    dbConn.commit()
    dbConn.close()

@app.route('/removerCategoria', methods=["POST"])
def remover_categoria():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cursor.execute(queries[1], (request.form["categoria_nome"],))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return str(e) 
  finally:
    cursor.close()
    dbConn.commit()
    dbConn.close()

@app.route('/inserirRetalhista', methods=["POST"])
def inserir_retalhista():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cursor.execute(queries[2], (request.form["retalhista_tin"], request.form["retalhista_nome"],))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return str(e) 
  finally:
    cursor.close()
    dbConn.commit()
    dbConn.close()

@app.route('/removerRetalhista', methods=["POST"])
def remover_retalhista():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cursor.execute(queries[3], (request.form["retalhista_tin"], request.form["retalhista_tin"], request.form["retalhista_tin"],))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return str(e) 
  finally:
    cursor.close()
    dbConn.commit()
    dbConn.close()

@app.route('/listarEventos', methods=["POST"])
def listar_eventos():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cursor.execute(queries[4], (request.form["ivm_num_serie"],))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return str(e) 
  finally:
    cursor.close()
    dbConn.close()


@app.route('/listarCategorias', methods=["POST"])
def listar_categorias():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cursor.execute(queries[5], (request.form["categoria_nome"],))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return str(e) 
  finally:
    cursor.close()
    dbConn.close()


app.run(host = '0.0.0.0', port=5001)


