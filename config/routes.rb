Rails.application.routes.draw do
  root :to => 'events#index'

  resources :events, except: :edit
  resources :organizers, only: [:new, :create]
  resources :volunteers, except: :edit
  resources :sessions, only: [:new, :create, :destroy]
end

# events GET    /events(.:format)              events#index
#                POST   /events(.:format)              events#create
#      new_event GET    /events/new(.:format)          events#new
#     edit_event GET    /events/:id/edit(.:format)     events#edit
#          event GET    /events/:id(.:format)          events#show
#                PATCH  /events/:id(.:format)          events#update
#                PUT    /events/:id(.:format)          events#update
#                DELETE /events/:id(.:format)          events#destroy
#     volunteers GET    /volunteers(.:format)          volunteers#index
#                POST   /volunteers(.:format)          volunteers#create
#  new_volunteer GET    /volunteers/new(.:format)      volunteers#new
# edit_volunteer GET    /volunteers/:id/edit(.:format) volunteers#edit
#      volunteer GET    /volunteers/:id(.:format)      volunteers#show
#                PATCH  /volunteers/:id(.:format)      volunteers#update
#                PUT    /volunteers/:id(.:format)      volunteers#update
#                DELETE /volunteers/:id(.:format)      volunteers#destroy
