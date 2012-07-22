ActiveAdmin.register AdminUser do
  index do
    column :email
    column :current_sign_in_at
    column :last_sign_in_at
    column :sign_in_count
    default_actions
  end

  form do |f|
    f.inputs "Admin Details" do
      f.input :email
      f.input :password
    end
    f.buttons
  end
  
  controller do 
    def destroy
      @admin_user = AdminUser.find(params[:id])
      begin
        @admin_user.destroy
        flash[:notice] = "Admin User was successfully destroyed."
      rescue Exception => e
        flash[:notice] = e.message
      end
  
      respond_to do |format|
        format.html { redirect_to admin_admin_users_url }
        format.json { head :no_content }
      end
    end
   end
    
end
