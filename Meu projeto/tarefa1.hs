module Tarefa1 where

import LI12122



validaPotencialMapa :: [(Peca,Coordenadas)] -> Bool
validaPotencialMapa [] = False
validaPotencialMapa m | (umaPorta m == True) && (umaPeca m == True) {- && (base_Caixa m == True) && (espacoVazio m == True) && (base_Mapa m == True) -} = True 
                      | otherwise = False



umaPorta :: [(Peca,Coordenadas)] -> Bool
umaPorta m | (nPortas m == 1) = True
           | otherwise = False


nPortas :: [(Peca,Coordenadas)] -> Int
nPortas ((p,c):h) | (p == Porta) = 1+nPortas h
                  | otherwise = nPortas h


umaPeca :: [(Peca,Coordenadas)] -> Bool
umaPeca (((x,xs),(y,ys)):h) | (xs == ys) = False
                            | otherwise = umaPeca h 