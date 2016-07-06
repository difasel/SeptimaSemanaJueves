

post '/muestra_tags' do 
  @tags_array = Tag.all
  
  erb :tags
end

