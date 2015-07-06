-- Giulio Stramondo
-- Date 06/07/2015

producer ag1 ag2 = prod' ag1 [] ag2 0 1 where
	prod' ag1 st1 ag2 st2 i 
	 | i >= 10 = (st2:st1)
	 | odd i = prod' ag1 (ag1 i st1) ag2 st2 (i+1)
	 | even i = prod' ag1 st1 ag2 (ag2 i st2) (i+1)


bau i [] = [i]
bau i  x = (i:x)

miao i st = ( i + st )


duofold f g base lst = duofold' f g base lst 1 where
	duofold' f g res [] _ = res
	duofold' f g curr (x:xs) i -- DID A MISTAKE HERE SQUARE BRACKET INSTEAD OF ROUND
		| odd i = duofold' f g (f curr x) xs (i+1)
		| even i = duofold' f g (g curr x) xs (i+1)

main=do
	   print $ producer bau miao -- [20,9,7,5,3,1]
	   print $ duofold (+) (-) 0 [1,2,3,4] -- prints -2
