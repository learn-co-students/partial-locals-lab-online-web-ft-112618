Rails.application.routes.draw do
  resources :classrooms
  resources :students
  get 'students/search' => 'students#search'
end