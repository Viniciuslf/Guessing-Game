
   
def boas_vindas
    puts "The Guessing Game"
    puts "Qual é o seu nome?"
    nome = gets.strip
    puts "\n\n\n\n\n\n"
    puts "Começaremos o jogo para você, #{nome}"
    nome
  end
  
  def dificuldade_jogo
    puts "Qual o nível de dificuldade?"
    puts "(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Insano"
    puts "Escolha: "
    dificuldade = gets.to_i
  end
  
  
  def sorteia_numero_secreto(dificuldade)
  
    case dificuldade
    when 1
      maximo = 30
    when 2
      maximo = 60
    when 3
      maximo = 100
    when 4
      maximo = 150
    else
      maximo = 200
  
    end
  
    puts "Escolhendo um número secreto entre 1 e #{maximo - 1}.."
    sorteado = rand(maximo)
    puts "Que tal advinhar hoje o nosso número secreto?"
    sorteado
  end
  
  def pede_um_numero(chutes,tentativa, limite_tentativas)
    puts "\n\n\n"
    puts "Tentativa #{tentativa} de #{limite_tentativas}"
    puts "Chutes até agora: #{chutes}"
    puts "Entre com o número"
    chute = gets.strip
    puts "Será que você acertou, seu chute foi #{chute}"
    chute.to_i
  end
  
  def ganhou
   
    puts
    puts "               Acertou!                "
    puts
  end
  
  
  def verifica_se_acertou(numero_secreto, chute)
    acertou = numero_secreto == chute
  
    if acertou
      ganhou
      return true
    end
  
    maior = numero_secreto > chute
    if maior
      puts "Hey, o número é maior :("
    else
      puts "Hey, se liga o número é menor ;)"
    end
    false
  end
  
  def joga(nome, dificuldade)
    numero_secreto = sorteia_numero_secreto dificuldade
  
    limite_tentativas = 5
    chutes = []
    pontos_ate_agora = 1000
  
    for tentativa in 1..limite_tentativas
  
      chute = pede_um_numero chutes, tentativa, limite_tentativas
      chutes << chute
  
      pontos_perdidos = (chute - numero_secreto).abs / 2.0
      pontos_ate_agora -= pontos_perdidos
      if verifica_se_acertou numero_secreto, chute
        break
      end
    end
    puts "GameOver ! sua pontuação foi de #{pontos_ate_agora}"
  end
  
  def quer_jogar
    puts "E aí, vai tentar novamente [S/N] ?"
    novo_jogo = gets.strip
    novo_jogo.upcase == "S"
  end
  
  nome = boas_vindas
  dificuldade = dificuldade_jogo
  
  
  loop do 
    joga nome, dificuldade
    if !quer_jogar
      break
    end
  end
  
  puts "Bye"