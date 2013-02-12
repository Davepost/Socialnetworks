FacePhoto::Application.routes.draw do
  root :to => "pages#home"
  
  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
	match 'signout', to: 'sessions#destroy', as: 'signout'
	
	match 'refresh', to: 'sessions#refresh', as: 'refresh'
  match 'familie',   to: 'pages#familie', as: 'familie'
  match 'mijn',   to: 'pages#mijn', as: 'mijn'
  match 'vrienden',   to: 'pages#vrienden', as: 'vrienden'
  match 'kennissen',   to: 'pages#kennissen', as: 'kennissen'
  match 'favoriete',   to: 'pages#favoriete', as: 'favoriete'
  
  match 'asign_group', to: 'sessions#asign_group', as: 'asign_group'
	
end
