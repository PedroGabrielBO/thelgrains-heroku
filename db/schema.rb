# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150718015151) do

  create_table "agendamentos", force: :cascade do |t|
    t.integer  "user_id",     null: false
    t.integer  "cliente_id"
    t.string   "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.boolean  "all_day"
  end

  add_index "agendamentos", ["cliente_id"], name: "index_agendamentos_on_cliente_id"
  add_index "agendamentos", ["user_id"], name: "index_agendamentos_on_user_id"

  create_table "ajudantes", id: false, force: :cascade do |t|
    t.integer "atendimento_id", null: false
    t.integer "user_id",        null: false
  end

  create_table "atendimentos", force: :cascade do |t|
    t.integer  "servico_id", null: false
    t.integer  "user_id",    null: false
    t.integer  "cliente_id"
    t.float    "gasto_add"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "atendimentos", ["cliente_id"], name: "index_atendimentos_on_cliente_id"
  add_index "atendimentos", ["servico_id"], name: "index_atendimentos_on_servico_id"
  add_index "atendimentos", ["user_id"], name: "index_atendimentos_on_user_id"

  create_table "categoria_servicos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clientes", force: :cascade do |t|
    t.string   "nome"
    t.string   "telefone"
    t.string   "celular"
    t.string   "email"
    t.string   "cpf",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "clientes", ["cpf"], name: "index_clientes_on_cpf", unique: true
  add_index "clientes", ["email"], name: "index_clientes_on_email"

  create_table "funcionarios", force: :cascade do |t|
    t.integer  "user_id",              null: false
    t.string   "nome"
    t.string   "telefone"
    t.string   "celular"
    t.string   "endereco"
    t.string   "cep",        limit: 8
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "funcionarios", ["user_id"], name: "index_funcionarios_on_user_id"

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.float    "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "servicos", force: :cascade do |t|
    t.integer  "categoria_servico_id", null: false
    t.string   "nome"
    t.float    "valor"
    t.float    "taxa_principal"
    t.float    "taxa_secundaria"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "servicos", ["categoria_servico_id"], name: "index_servicos_on_categoria_servico_id"

  create_table "users", force: :cascade do |t|
    t.string   "cpf",                limit: 11,                 null: false
    t.string   "encrypted_password",                            null: false
    t.boolean  "admin",                         default: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "users", ["cpf"], name: "index_users_on_cpf", unique: true

  create_table "web_comentarios", force: :cascade do |t|
    t.string   "nome"
    t.string   "email",      null: false
    t.text     "comentario"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "web_comentarios", ["email"], name: "index_web_comentarios_on_email"

end
