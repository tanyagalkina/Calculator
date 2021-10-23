module Bootstrap
    ( 
     module Bootstrap
     , module Control.Applicative
    ) where

import Data.Char
import Control.Applicative
import Debug.Trace

--newtype NParser a = P (String -> Maybe (a, String))


--return emtpy list if fails
newtype NParser a = P (String ->[(a, String)])


parse :: NParser a -> String -> [(a,String)]
--parse (P p) input = traceShow ("trace" ++ show input) p input
parse (P p) input = p input


item :: NParser Char
item = P (\input -> case input of
                     []     -> []
                     (x:xs) -> [(x,xs)])


instance Functor NParser where
   -- fmap :: (a -> b) -> Parser a -> Parser b
   fmap g p = P (\input -> case parse p input of
                            []        -> []
                            [(v,out)] -> [(g v, out)])

instance Applicative NParser where
   -- pure :: a -> Parser a
   pure v = P (\input -> [(v,input)])

   -- <*> :: Parser (a -> b) -> Parser a -> Parser b
   pg <*> px = P (\input -> case parse pg input of
                             []        -> []
                             [(g,out)] -> parse (fmap g px) out)

instance Monad NParser where
   -- (>>=) :: Parser a -> (a -> Parser b) -> Parser b
   p >>= f = P (\input -> case parse p input of
                           []        -> []
                           [(v,out)] -> parse (f v) out)


instance Alternative NParser where
   -- empty :: Parser a
   empty = P (\input -> [])

   -- (<|>) :: Parser a -> Parser a -> Parser a
   p <|> q = P (\input -> case parse p input of
                           []        -> parse q input
                           [(v,out)] -> [(v,out)])


sat :: (Char -> Bool) -> NParser Char
sat p = item >>= \x ->
           if p x then return x else empty


isFloatDigit          :: Char -> Bool
isFloatDigit c        = (c == '.' ||
       (fromIntegral (ord c - ord '0') :: Word) <= 9)


digitF' :: NParser Char
digitF' = sat isFloatDigit

char :: Char -> NParser Char
char x = sat (== x)


validFloat :: String -> Bool
validFloat xs | len == 1 || len == 0 = True
               | otherwise = False
                  where len =  (length $ filter (== '.') xs)



posflt :: NParser Float
posflt = do char '+'
            n <- pflt
            return (n)
            <|> pflt


pflt :: NParser Float
pflt =  some digitF' >>= \xs ->
              if validFloat xs
                  then return (read xs)
              else empty


--pflt' :: NParser Float
--pflt' = do
--      char '+'
--      xs <-              
           
{--flt :: NParser Float
flt = do sign <- (char '-' <|> char '+')
         n <- pflt
         if sign == '-' then
           return (-n)
         else return n
           <|> pflt--}

-------------------------------
flt :: NParser Float
flt = do char '-'
         n <- pflt
         return (-n)
---- pflt
         <|> posflt

------------------------------