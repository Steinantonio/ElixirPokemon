defmodule ExmonApi do
  alias ExmonApi.{Trainer, Pokemon}
  alias ExmonApi.Trainer.Pokemon, as: TrainerPokemon

  defdelegate createTrainer(params), to: Trainer.Create, as: :call #delegar uma funcao para algum controller ou modulo
  defdelegate deleteTrainer(params), to: Trainer.Delete, as: :call
  defdelegate fetchTrainer(params), to: Trainer.Get, as: :call
  defdelegate updateTrainer(params), to: Trainer.Update, as: :call


  defdelegate getPokemon(params), to: Pokemon.Get, as: :call
  defdelegate createTrainerPokemon(params), to: TrainerPokemon.Create, as: :call
  defdelegate deleteTrainerPokemon(params), to: TrainerPokemon.Delete, as: :call
  defdelegate fetchTrainerPokemon(params), to: TrainerPokemon.Get, as: :call
  defdelegate updateTrainerPokemon(params), to: TrainerPokemon.Update, as: :call

end
