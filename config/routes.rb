Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: lambda {|env| [404, {}, ['{"Cloud Assignment3": "Please use the correct api endpoints"}']] }, via: 'get'
  resources :students, only: [:index, :create, :destroy] do
    member do
      post :upload_image
      get :images
    end
  end
  
  match '*wrong', via: 'get', to: lambda {|env| [404, {}, ['{"error": "Please make sure it is correct endpoint"}']] }

end
