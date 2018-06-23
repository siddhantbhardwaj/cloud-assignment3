Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :students, only: [:index, :create, :destroy] do
    member do
      post :upload_image
      get :images
    end
  end
  
  
  upload_image_student POST   /students/:id/upload_image(.:format) students#upload_image
        images_student GET    /students/:id/images(.:format)       students#images
              students GET    /students(.:format)                  students#index
                       POST   /students(.:format)                  students#create
               student DELETE /students/:id(.:format)              students#destroy

end
