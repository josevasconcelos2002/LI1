{-
Module : Tarefa1
Description : Validação de um mapa
Copyright : José Queirós <a98555@alunos.uminho.pt>;
                     José Pedro Torres Vasconcelos <a100763@alunos.uminho.pt>
         
-}
module Tarefa1 where

import LI12223


mapaVálido :: Mapa -> Bool
mapaVálido (Mapa _ []) = False
mapaVálido m | mapaVálido_aux m = True
             | otherwise = False


mapaVálido_aux :: Mapa -> Bool
mapaVálido_aux m | (terreno_proprio m &&  objs_length m && has_nenhum m) = True
                 | otherwise = False

{- | A função 'terreno_proprio' verifica se não existem obstáculos
em terrenos impróprios, como por exemplo, troncos em estradas ou relvas,
árvores em rios ou estradas.

== Propriedade :

prop> terreno_proprio (Mapa l []) = True


== Exemplos de utilização :

>>> terreno_proprio (Mapa 3 [(Relva,[Carro])])
False

>>> terreno_proprio (Mapa 3 [(Relva,[Nenhum,Árvore])])
True

-}
terreno_proprio :: Mapa -> Bool
terreno_proprio (Mapa _ []) = True
terreno_proprio m@(Mapa l ((t,obj@(ob:objs)):h))  | is_rio m  && valida_rio obj = terreno_proprio (Mapa l h) 
                                                  | is_estrada m && valida_estrada obj = terreno_proprio (Mapa l h)
                                                  | is_relva m && valida_relva obj = terreno_proprio (Mapa l h)
                                                  | otherwise = False
{-
O comprimento da lista de obstáculos de cada linha corresponde exatamente à
largura do mapa.
-}
objs_length :: Mapa -> Bool
objs_length (Mapa _ []) = True
objs_length (Mapa l ((t,(obj:objs)):h)) | (length (obj:objs) == l) = objs_length (Mapa l h)
                                        | otherwise = False
{-  
Em qualquer linha existe, no mínimo, um “obstáculo” Nenhum. Ou seja, uma linha
não pode ser composta exclusivamente por obstáculos, precisando de haver pelo
menos um espaço livre.
-}
has_nenhum :: Mapa -> Bool
has_nenhum (Mapa _ []) = True
has_nenhum (Mapa l ((t,(obj:objs)):h)) | (obj == Nenhum) = has_nenhum (Mapa l h)
                                       | otherwise = has_nenhum (Mapa l ((t,(objs)):h))

is_rio :: Mapa -> Bool
is_rio (Mapa _ []) = True
is_rio (Mapa l ((t,(obj:objs)):h)) | (t == Rio l) = is_rio (Mapa l h)
                                   | otherwise = False


is_estrada :: Mapa -> Bool
is_estrada (Mapa _ []) = True
is_estrada (Mapa l ((t,(obj:objs)):h)) | (t == Estrada l) = is_estrada (Mapa l h)
                                     | otherwise = False


is_relva :: Mapa -> Bool
is_relva (Mapa _ []) = True
is_relva (Mapa l ((t,(obj:objs)):h)) | (t == Relva) = is_relva (Mapa l h)
                                     | otherwise = False


valida_rio :: [Obstáculo] -> Bool
valida_rio [] = True 
valida_rio (obj:objs) | (obj == Tronco) = valida_rio objs
                      | (obj == Nenhum) = valida_rio objs
                      | otherwise = False


valida_estrada :: [Obstáculo] -> Bool
valida_estrada [] = True 
valida_estrada (obj:objs) | (obj == Carro) = valida_estrada objs
                          | (obj == Nenhum) = valida_estrada objs
                          | otherwise = False


valida_relva :: [Obstáculo] -> Bool
valida_relva [] = True 
valida_relva (obj:objs) | (obj == Árvore) = valida_relva objs
                        | (obj == Nenhum) = valida_relva objs
                        | otherwise = False


{-
valida_tronco :: Mapa -> Bool
valida_tronco Mapa l ((t,(ob:obs)):h) |
-} 