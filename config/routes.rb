Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:photo_id", { :controller => "photos", :action => "baii" })

  post("/insert_photo", { :controller => "photos", :action => "create" })

  post("/update_photo/:photo_id", { :controller => "photos", :action => "update" })

  post("/add_comment/:photo_id", { :controller => "photos", :action => "comment" })

  post("/add_user", { :controller => "users", :action => "add_user" })

  post("/update_user/:user_id", { :controller => "users", :action => "update_user"})
end
