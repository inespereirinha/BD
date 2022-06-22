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
  "INSERT INTO Categoria VALUES (%s); \
  INSERT INTO Categoria_simples VALUES (%s);",

  "DELETE FROM Categoria_simples WHERE nome = %s; \
  INSERT INTO Super_categoria VALUES (%s); \
  INSERT INTO Categoria VALUES (%s); \
  INSERT INTO Categoria_simples VALUES (%s); \
  INSERT INTO Tem_outra VALUES (%s, %s);",

  "DELETE FROM Evento_reposicao WHERE ean IN (SELECT ean FROM Produto WHERE cat = %s); \
  DELETE FROM Responsavel_por WHERE nome_cat = %s; \
  DELETE FROM Planograma WHERE ean IN (SELECT ean FROM Produto WHERE cat = %s); \
  DELETE FROM Prateleira WHERE nome = %s; \
  DELETE FROM Tem_categoria WHERE nome = %s; \
  DELETE FROM Tem_outra WHERE super_categoria = %s OR categoria = %s; \
  DELETE FROM Super_categoria WHERE nome = %s; \
  DELETE FROM Categoria_simples WHERE nome = %s; \
  DELETE FROM Categoria WHERE nome = %s; \
  INSERT INTO Categoria_simples (nome) SELECT nome FROM Super_categoria NATURAL JOIN Tem_outra WHERE Super_categoria.nome != Tem_outra.super_categoria GROUP BY nome; \
  DELETE FROM Super_categoria WHERE nome IN (SELECT nome FROM Super_categoria NATURAL JOIN Tem_outra WHERE Super_categoria.nome != Tem_outra.super_categoria GROUP BY nome);",

  "INSERT INTO Retalhista VALUES (%s, %s);",
  
  "DELETE FROM Responsavel_por WHERE tin = %s; \
   DELETE FROM Evento_reposicao WHERE tin = %s; \
   DELETE FROM Retalhista WHERE tin = %s;",

  "SELECT cat, CAST(unidades AS VARCHAR(255)), CAST(instante AS VARCHAR(255)) FROM Evento_reposicao NATURAL JOIN Produto WHERE num_serie = %s ORDER BY instante;",

  "SELECT categoria FROM Tem_outra WHERE super_categoria = %s;",

  "INSERT INTO Responsavel_por VALUES(%s, %s, %s, %s);"
]


retalhista = []
retalhista_tin = ""
retalhista_nome = ""

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
    return render_template("error.html", erro=e) #Renders a page with the error.
  finally:
    cursor.close()
    dbConn.close()
    

@app.route('/inserirCategoriaSimples', methods=["POST"])
def inserir_categoria_simples():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    cursor.execute(queries[0], (request.form["categoria_nome"],request.form["categoria_nome"],))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return render_template("error.html", erro=e)
  finally:
    cursor.close()
    dbConn.commit()
    dbConn.close()

@app.route('/inserirCategoriaRelacoes', methods=["POST"])
def inserir_categoria_relacoes():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    sub_cat = request.form["categoria_sub"]
    super_cat = request.form["categoria_super"]
    cursor.execute(queries[1], (super_cat, super_cat, sub_cat, sub_cat, super_cat, sub_cat,))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return render_template("error.html", erro=e) 
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
    cat = request.form["categoria_nome"]
    cursor.execute(queries[2], (cat, cat, cat, cat, cat, cat, cat, cat, cat, cat,))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return render_template("error.html", erro=e) 
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
    global retalhista
    global retalhista_tin
    global retalhista_nome
    retalhista = []
    retalhista_tin = request.form["retalhista_tin"]
    retalhista_nome = request.form["retalhista_nome"]
    return render_template("retalhista.html", retalhista_tin=retalhista_tin, retalhista_nome=retalhista_nome)
  except Exception as e:
    return render_template("error.html", erro=e) 
  finally:
    cursor.close()
    dbConn.close()

@app.route('/removerRetalhista', methods=["POST"])
def remover_retalhista():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    tin = request.form["retalhista_tin"]
    cursor.execute(queries[4], (tin, tin, tin,))
    return render_template("success.html", cursor=cursor)
  except Exception as e:
    return render_template("error.html", erro=e) 
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
    cursor.execute(queries[5], (request.form["ivm_num_serie"],))
    return render_template("successSelectIVM.html", cursor=cursor)
  except Exception as e:
    return render_template("error.html", erro=e) 
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
    cursor.execute(queries[6], (request.form["categoria_nome"],))
    return render_template("successSelectCategoria.html", cursor=cursor)
  except Exception as e:
    return render_template("error.html", erro=e) 
  finally:
    cursor.close()
    dbConn.close()


@app.route('/adicionarResponsabilidades', methods=["POST"])
def adicionar_responsabilidades():
  dbConn=None
  cursor=None
  try:
    dbConn = psycopg2.connect(DB_CONNECTION_STRING)
    cursor = dbConn.cursor(cursor_factory = psycopg2.extras.DictCursor)
    global retalhista
    global retalhista_tin
    global retalhista_nome
    if request.form['action'] == 'NEXT':
      retalhista.append([request.form["categoria_nome"], request.form["ivm_num_serie"], request.form["ivm_fabricante"]])
      return render_template("retalhista.html", retalhista_tin=retalhista_tin, retalhista_nome=retalhista_nome)
    elif request.form['action'] == 'CANCEL':
      retalhista = []
      retalhista_tin = ""
      retalhista_nome = ""
      return render_template("index.html", cursor=cursor)
    else :
      if request.form["categoria_nome"] != "" and request.form["ivm_num_serie"] != "" and request.form["ivm_fabricante"] != "":
        retalhista.append([request.form["categoria_nome"], request.form["ivm_num_serie"], request.form["ivm_fabricante"]])
      
      cursor.execute(queries[3], (retalhista_tin, retalhista_nome,))
      
      for elem in retalhista:
        print(elem)
        cursor.execute(queries[7], (elem[0], retalhista_tin, elem[1], elem[2],))  
        print("hua")
      
      dbConn.commit()
      return render_template("success.html", cursor=cursor)
  except Exception as e:
    return render_template("error.html", erro=e) 
  finally:
    cursor.close()
    dbConn.close()


app.run(host = '0.0.0.0', port=5001)


