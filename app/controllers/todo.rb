Handson::App.controllers :todo do

  get :index do
    @todos = Todo.all
    render :index
  end  

  get :new do
    @todo = Todo.new
    render :new
  end

  post :new do
    Todo.create params[:todo]
    redirect url(:todo, :index)
  end

  get :remove, :with => :id do
    todo = Todo.find params[:id]
    todo.destroy
    redirect url(:todo, :index)
  end

  get :update, :with => :id do
    @todo = Todo.find params[:id]
    render :update
  end

  post :update, :with => :id do
    todo = Todo.find params[:id]
    todo.update_attributes params[:todo]
    redirect url(:todo, :index)
  end
end
