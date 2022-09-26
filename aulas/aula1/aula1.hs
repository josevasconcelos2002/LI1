module Aula1 where

--ex 2

-- a)
area :: Float -> Float -> Float
area a b = a*b

--b)
perimetro :: Float -> Float -> Float
perimetro a b = 2*(a+b)

--c)
pertence :: Char -> String -> Bool
pertence x l = elem x l

--d)
rm :: [a] -> [a]
rm [] = []
rm l | mod (length l) 2 == 0 = tail l
     | otherwise = init l

--e)
par :: [a] -> (a,a)
-- par [] não pode ser utilizado
par l = (head l, last l)

--f)
par_nomes :: [String] -> (String,String)
par_nomes l = (head l, last l)  -- == par l

--g)
par1 :: ([a],[a]) -> (a,[a])
par1 (a,b) = (head a, b)

--h)
nome :: [String] -> String
nome l = [head(head l)] ++ "." ++ last l