Rails.application.routes.draw do
  root to: "students#index"
  resources :students do
    member do
      get :assign_teachers
      post :create_teachers
      get :assign_subjects
      post :create_subjects
    end
  end

  resources :teachers do
    member do
      get :assign_students
      post :create_students
      get :assign_subjects
      post :create_subjects
    end
  end

  resources :subjects
end
