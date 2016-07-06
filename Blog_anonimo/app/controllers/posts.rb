
get '/post_temp' do 

  erb :post
end

get '/find_temp' do

  erb :find_post

end

get '/edita_temp' do

  erb :update_post

end


get '/elimina_temp' do

  erb :delete_post

end

post '/post' do

  title_post = params[:title]
  body_post = params[:body_text]
  tags = params[:tags]
  p title_post
  p body_post
  tags = tags.split(',').map! { |value| value.strip }
  p tags
  post = Post.create(body: body_post, title: title_post)
  tags.each do |tag|
    new_tag = Tag.create(tag: tag)
    if new_tag.valid?
      post.tags << new_tag
    else
      new_tag = Tag.find_by(tag: tag)
      post.tags << new_tag
    end


  end

  # tags.each do |tag|
  #   tag = Tag.create(tag: tag)
  # end

 

  redirect to ('/')
end

post '/muestra_posts' do

  @posts = Post.all
  # p @posts.tags

  erb :all_post

end

post '/busca_posts' do

  

  title_find = params[:title_text]
  p title_find
  @posts = [Post.find_by(title: title_find)]
  p @posts

  if @posts != [nil]
    erb :all_post

  else
    @mensaje = "Tu post no fue encontrado"
    erb :find_post
  end

end


post '/edita_posts' do

  title_update = params[:title_text]
  p title_update
  new_title_update = params[:new_title_text]
  p new_title_update
  new_body_update = params[:new_body_text]
  p new_body_update
  posts = Post.find_by(title: title_update)
  
  if posts != nil
    @mensaje = "Tu post fue editado"
    posts.update(title: new_title_update, body: new_body_update)
    erb :update_post

  else
    @mensaje = "Tu post no fue encontrado"
    erb :update_post
  end



end

post '/elimina_posts' do

  title_delete = params[:title_text]
  p title_delete
  posts = Post.find_by(title: title_delete)
  p posts

  if posts != nil
    @mensaje = "Tu post fue eliminado"
    posts.destroy
    erb :delete_post

  else
    @mensaje = "Tu post no fue encontrado"
    erb :delete_post
  end


end



