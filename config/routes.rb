Rails.application.routes.draw do
	root "posts#index"

	resource :posts
 end
