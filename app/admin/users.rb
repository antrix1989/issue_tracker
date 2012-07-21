ActiveAdmin.register User do
  index do
    column :email
    column :first_name
    column :last_name
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end
  
  show do |ad|
    attributes_table do
      row :email
      row :first_name
      row :last_name
      row :current_sign_in_at
      row :last_sign_in_at
      row :sign_in_count
    end
    active_admin_comments
  end
  
  form do |f|
    f.inputs "" do
      f.input :email
      f.input :password
      f.input :first_name
      f.input :last_name
    end
    f.buttons
  end
end
