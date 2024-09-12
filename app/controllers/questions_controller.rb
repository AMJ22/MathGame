class QuestionsController < ApplicationController
  def new
    # Génère des nombres aléatoires entre 1 et 10
    @number1 = rand(1..10)
    @number2 = rand(1..10)

    # Choisir aléatoirement une opération
    operations = ['+', '-', '*', '/']
    @operation = operations.sample

    # Calculer la bonne réponse
    @answer = case @operation
              when '+' then @number1 + @number2
              when '-' then @number1 - @number2
              when '*' then @number1 * @number2
              when '/' then @number2 == 0 ? 0 : @number1 / @number2
              end
  end

  def create
    # Récupérer les paramètres soumis par l'utilisateur
    submitted_answer = params[:answer].to_i
    correct_answer = params[:correct_answer].to_i

    # Vérifier si la réponse est correcte
    if submitted_answer == correct_answer
      flash[:notice] = "Bravo! C'est la bonne réponse."
    else
      flash[:alert] = "Oops! La bonne réponse était #{correct_answer}."
    end

    # Rediriger vers une nouvelle question
    redirect_to new_question_path
  end
end
