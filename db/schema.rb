# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180509232513) do

  create_table "alumno_cursos", force: :cascade do |t|
    t.integer  "alumno_id"
    t.integer  "curso_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_alumno_cursos_on_alumno_id"
    t.index ["curso_id"], name: "index_alumno_cursos_on_curso_id"
  end

  create_table "alumnos", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contenido_cursos", force: :cascade do |t|
    t.integer  "contenido_id"
    t.integer  "curso_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["contenido_id"], name: "index_contenido_cursos_on_contenido_id"
    t.index ["curso_id"], name: "index_contenido_cursos_on_curso_id"
  end

  create_table "contenidos", force: :cascade do |t|
    t.string   "titulo"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "url"
  end

  create_table "cursos", force: :cascade do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "evaluacions", force: :cascade do |t|
    t.integer  "alumno_id"
    t.integer  "curso_id"
    t.integer  "nota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_evaluacions_on_alumno_id"
    t.index ["curso_id"], name: "index_evaluacions_on_curso_id"
  end

  create_table "nota", force: :cascade do |t|
    t.integer  "alumno_id"
    t.integer  "curso_id"
    t.integer  "nota"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alumno_id"], name: "index_nota_on_alumno_id"
    t.index ["curso_id"], name: "index_nota_on_curso_id"
  end

  create_table "profesor_cursos", force: :cascade do |t|
    t.integer  "profesor_id"
    t.integer  "curso_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["curso_id"], name: "index_profesor_cursos_on_curso_id"
    t.index ["profesor_id"], name: "index_profesor_cursos_on_profesor_id"
  end

  create_table "profesors", force: :cascade do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
