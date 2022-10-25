module Tarefa1_Spec where

import LI12223
import Tarefa1
import Test.HUnit

testes_T1 = test [
            "Teste 1" ~: False ~=? mapaVálido (Mapa 1 []),
            "Teste 2"
-- ...
            ]