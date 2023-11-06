Rails.application.routes.draw do
  resources :evaluations
  post '/evaluations/new' => 'evaluations#create'
  get '/evaluations/team' => 'evaluations#team_evaluation'
  post '/teams/' => 'teams#create'
  resources :teams
  get 'student_sessions/new' => 'student_sessions#new'
  post 'student_sessions/create' => 'student_sessions#create'
  delete 'student_sessions/destroy' => 'student_sessions#destroy'
  get 'survey' => 'pages#home'
  post 'teams/grade' => 'teams#grade'
  # testing getting data (olivia)
  get 'presentation_team/:data' => 'presentation_events#presentation_team'

  #testing (yang)
  get 'instructor_home_page' => 'pages#instructor_home_page'

  #testing export to csv(Chaobo)
  get '/export'=>'application#export'

  resources :students
  resources :presentation_events
  root 'pages#index'
  devise_for :instructors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_scope :instructor do
    get '/instructors/sign_out' => 'devise/sessions#destroy'
  end
  
  devise_scope :student do
    get '/students/sign_out' => 'devise/sessions#destroy'
  end
  
end
