module TheGrammer
 (
     module TheGrammer
     ,module Bootstrap

 )
where
import Bootstrap
import OurMagicParser

oper:: Char -> Float -> Float -> Float
oper ' ' x y = 2 / 0
oper '-' x y = x - y
oper '+' x y = x + y
oper '*' x y = x * y
oper '/' x y = x / y


expression :: NParser Float
expression = 
       do
       x <- term
       op <- (char '+' <|> char '-')
       y <- expression    
       return (oper op x y)
       <|> term


term::NParser Float
term = do
       x <- factor
       op <- char '*' <|> char '/'
       y <- term
       return (oper op x y)
       <|> factor 

factor::NParser Float
factor = do
    x <- pow
    _ <- char '^'
    y <- factor
    return (x ** y)
    <|> pow

pow::NParser Float
pow = do
      --sign <- getFrontSign
      _ <- char '('
      x <- expression
      _ <- char ')'
      return x
      <|> flt
