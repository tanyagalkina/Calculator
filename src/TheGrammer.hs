module TheGrammer
 (
     module TheGrammer
     ,module Bootstrap

 )
where
import Bootstrap

oper:: Char -> Float -> Float -> Float
oper '-' x y = x - y
oper '+' x y = x + y
oper '*' x y = x * y
oper '/' x y = x / y


expression = 
       do
       --term >>= \x ->    
       x <- term
       op <- (char '+' <|> char '-')
       --(char '+' <|> char '-') >>= \op -> 
       --expression >>= \y ->
       y <- expression    
       return (oper op x y)
       <|> term

term = do
       x <- factor
       op <- char '*' <|> char '/'
       y <- term
       return (oper op x y)
       <|> factor 


factor = do
    x <- pow
    char '^'
    y <- factor
    return (x ** y)
    <|> pow


pow = do
      char '('
      x <- expression
      char ')'
      return x
      <|> flt
