# Implement the new web-based CRM here.
# Do NOT copy the CRM class from the old crm assignment, as it won't work at all for the web-based version!
# You'll have to implement it from scratch.
require_relative "contact"
require "sinatra"

Contact.create("Edwin", "Au", "edwinau@rogers.com","CEO")
Contact.create("Greg", "Boone", "Boonev@rogers.com","CEO")
Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'CEO')
Contact.create('Sergey', 'Brin', 'sergey@google.com', 'Co-Founder')
Contact.create('Steve', 'Jobs', 'steve@apple.com', 'Visionary')
Contact.create('Betty', 'Maker', 'betty@bitmakerlabs.com', 'Developer')


get "/" do
  @crm_app_name = "Edwin's CRM"
  @server_time = Time.now
  erb :index
end

get "/contacts" do
  erb :contacts
end

get "/new_contact" do
  erb :new_contact
end

post '/contacts' do
  Contact.create(options)
  redirect to('/contacts')
  puts params
end

get "/search_contact" do
  contact = Contact.find(1000)
  erb :search_contact
end

get "/delete_contact" do
  # @@contacts.delete_if do |contact|
  # contact.first_name == self.first_name
  # end
  Contact.delete
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
    if @contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
end
