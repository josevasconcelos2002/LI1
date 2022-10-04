module Aula2 where

import Data.Char

--fact
fact :: Double -> Double
fact 0 = 1
fact n = n * fact(n-1)


--1)
adiciona :: [Int] -> Int -> [Int]
adiciona [] _ = []
adiciona (x:xs) v = (x+v) : adiciona xs v

--2)
remove_string :: [String] -> Char -> [String]
remove_string [] _ = []
remove_string (x:xs) c | c == (head(x)) = remove_string xs c
                       | otherwise = x : remove_string xs c

--3)lista de Strings
adiciona1 :: [(Int,Int)] -> Int -> [(Int,Int)]
adiciona1 [] _ = []
adiciona1 (x:xs) v =  ((fst(x)+v,snd(x)) : (adiciona1 (xs) v))

--4)
maior_2 :: [(Int,Int)] -> Int
maior_2 [] = 0
maior_2 [(a,b)] = b
maior_2 (x:h:xs) = if(snd(x)>=snd(h)) then  maior_2 (x:xs)
                   else maior_2 (h:xs)

--5)
prox_dg :: Char -> Char
prox_dg d = chr(ord(d)+1)

--6)
prox_dg1 :: [Char] -> [Char]
prox_dg1 [] = []
prox_dg1 (x:xs) = chr(ord(x)+1) : prox_dg1 xs

--7)
prox_vg :: [Char] -> [Char]
prox_vg [] = []
prox_vg (x:xs) | x == 'a' = 'e' : prox_vg xs
               | x == 'e' = 'i' : prox_vg xs
               | x == 'i' = 'o' : prox_vg xs
               | x == 'o' = 'u' : prox_vg xs
               | x == 'u' = 'a' : prox_vg xs

--8)
type Nome = String
type Coordenada = (Int, Int)
data Movimento = N | S | E | W 
                deriving (Show,Eq) -- norte, sul, este, oeste
type Movimentos = [Movimento]
data PosicaoPessoa = Pos Nome Coordenada 
                     deriving (Show,Eq)

--a)
posicao :: PosicaoPessoa -> Movimentos -> PosicaoPessoa
posicao (Pos n (a,b)) [] = Pos n (a,b)
posicao (Pos n (a,b)) (x:xs) | x == N = posicao (Pos n (a,b+1)) xs
                             | x == S = posicao (Pos n (a,b-1)) xs
                             | x == E = posicao (Pos n (a+1,b)) xs
                             | x == W = posicao (Pos n (a-1,b)) xs

--b)
posicoesM :: [PosicaoPessoa] -> Movimento -> [PosicaoPessoa]
posicoesM [] _ = []
posicoesM ((Pos n (a,b)):h) m | m == N = (Pos n (a,b+1)) : posicoesM h m 
                              | m == S = (Pos n (a,b-1)) : posicoesM h m
                              | m == E = (Pos n (a+1,b)) : posicoesM h m
                              | m == W = (Pos n (a-1,b)) : posicoesM h m

--c)
posicoesMs :: [PosicaoPessoa] -> Movimentos -> [PosicaoPessoa]
posicoesMs [] _ = []
posicoesMs ((Pos n (a,b)):h) (x:xs) = posicao (Pos n (a,b)) (x:xs) : posicoesMs h (x:xs)

--d)
pessoasNorte :: [PosicaoPessoa] -> [Nome]
pessoasNorte [] = []
pessoasNorte [Pos n (a,b)] = [n]
pessoasNorte [(Pos n (a,b)),(Pos c (d,e))] | b == e = [n,c]
pessoasNorte ((Pos n (a,b)):(Pos c (d,e)):h) | b > e = pessoasNorte((Pos n (a,b)):h)
                                             | b < e = pessoasNorte((Pos c (d,e)):h)pessoasNorte ((Pos n (a,b)):(Pos c (d,e)):h)
                                             | otherwise = pessoasNorte ((Pos (n++c) (a,b)):h)