class TodosController < ApplicationController
    before_action :set_todo, only: [:show, :edit, :update, :destroy]

  def index
    @todos = Todo.ordered
  end

  def show
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      respond_to do |format|
        format.html { redirect_to todos_path, notice: "Todo was successfully created." }
        format.turbo_stream
      end
    else
      # Add `status: :unprocessable_entity` here
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @todo.update(todo_params)
      redirect_to todos_path, notice: "Todo was successfully updated."
    else
      # Add `status: :unprocessable_entity` here
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy
  
    respond_to do |format|
      format.html { redirect_to todos_path, notice: "todo was successfully destroyed." }
      format.turbo_stream
    end
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:name, :author)
  end
end
