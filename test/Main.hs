--
-- EPITECH PROJECT, 2021
-- EvalExpr
-- File description:
-- Spec
--

module Main where

import Test.HUnit
import OurMagicParser
import TheGrammer
import Bootstrap

test1 = TestCase (assertEqual "isFloatDigit 2," (True) (Bootstrap.isFloatDigit '2'))

test2 = TestCase (assertEqual "isFloatDigit c," (False) (Bootstrap.isFloatDigit 'c'))

-- rajouter le test pour les espaces

test3 = TestCase (assertEqual "oper -," (-1.0) (TheGrammer.oper '-' 2 3))

test4 = TestCase (assertEqual "oper -," (3.0) (TheGrammer.oper '-' 6 3))

test5 = TestCase (assertEqual "oper +," (16.2) (TheGrammer.oper '+' 12 4.2))

test6 = TestCase (assertEqual "oper +," (1.0) (TheGrammer.oper '+' (-2) 3))

test7 = TestCase (assertEqual "oper *," (-6.0) (TheGrammer.oper '*' (-2) 3))

test8 = TestCase (assertEqual "oper /," (3.0) (TheGrammer.oper '/' 9 3))

test9 = TestCase (assertEqual "parse," ([(12.0,"")]) 
                (Bootstrap.parse TheGrammer.expression "9+3"))

errorTest :: Test
errorTest = TestList [TestLabel "test1" test1, TestLabel "test2" test2]

operTest :: Test
operTest = TestList [TestLabel "test3" test3, TestLabel "test4" test4, 
        TestLabel "test5" test5,TestLabel "test6" test6, TestLabel "test7" test7, 
        TestLabel "test8" test8, TestLabel "test9" test9]

runTests :: IO Counts
runTests = do 
        _ <-runTestTT errorTest
        runTestTT operTest

main :: IO Counts
main = runTests