ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :admin

  index do
    selectable_column
    id_column
    column :nome
    column :cpf
    column :admin
    column :created_at
    actions
  end

  filter :cpf
  filter :created_at

  form do |f|
    f.inputs 'Admin Details' do
      f.input :cpf
      f.input :admin
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
