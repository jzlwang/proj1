class PokemonController < ApplicationController
  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(create_args)
    @pokemon.health = 100
    @pokemon.level = 1
    @pokemon.trainer_id = current_trainer.id
    @pokemon.save
    if @pokemon.save == false
      flash[:error] = @pokemon.errors.full_messages.to_sentence
      redirect_to new_path
    else
      redirect_to current_trainer
    end
  end

  def capture
    @pokemon = Pokemon.find(params[:id])
    @pokemon.trainer_id = current_trainer.id
    @pokemon.save
    redirect_to root_path
  end
  
  def damage
    @pokemon = Pokemon.find(params[:id])
    @pokemon.health -= 10
    @pokemon.save
    if @pokemon.health <= 0
      @pokemon.destroy
    end
    redirect_to current_trainer
  end

  private
  def create_args
    params.require(:pokemon).permit(:name)
  end
end
