module LI12223 where


type Velocidade = Int
data Terreno = Rio Velocidade
             | Estrada Velocidade
             | Relva
    deriving (Show, Read, Eq, Ord)
    
data Obstáculo = Nenhum
               | Tronco
               | Carro
               | Árvore
        deriving (Show, Read, Eq, Ord)

type Largura = Int
data Mapa = Mapa Largura [(Terreno, [Obstáculo])]
type Coordenadas = (Int, Int)
data Jogador = Jogador Coordenadas
data Jogo = Jogo Jogador Mapa