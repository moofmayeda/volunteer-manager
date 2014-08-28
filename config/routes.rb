Rails.application.routes.draw do
  root :to => 'actions#index'

  resources :actions

  resources :volunteers
end

# root GET    /                              actions#index
#        actions GET    /actions(.:format)             actions#index
#                POST   /actions(.:format)             actions#create
#     new_action GET    /actions/new(.:format)         actions#new
#    edit_action GET    /actions/:id/edit(.:format)    actions#edit
#         action GET    /actions/:id(.:format)         actions#show
#                PATCH  /actions/:id(.:format)         actions#update
#                PUT    /actions/:id(.:format)         actions#update
#                DELETE /actions/:id(.:format)         actions#destroy
#     volunteers GET    /volunteers(.:format)          volunteers#index
#                POST   /volunteers(.:format)          volunteers#create
#  new_volunteer GET    /volunteers/new(.:format)      volunteers#new
# edit_volunteer GET    /volunteers/:id/edit(.:format) volunteers#edit
#      volunteer GET    /volunteers/:id(.:format)      volunteers#show
#                PATCH  /volunteers/:id(.:format)      volunteers#update
#                PUT    /volunteers/:id(.:format)      volunteers#update
#                DELETE /volunteers/:id(.:format)      volunteers#destroy
