--
-- EPITECH PROJECT, 2021
-- EvalExpr
-- File description:
-- Spec
--

-- module TestU where
module Main where

-- import Main
import Test.HUnit
import OurMagicParser
import TheGrammer
import Bootstrap

test1 = TestCase (assertEqual "isFloatDigit 2," (True) (Bootstrap.isFloatDigit '2'))

test2 = TestCase (assertEqual "isFloatDigit c," (False) (Bootstrap.isFloatDigit 'c'))

firstTest :: Test
firstTest = TestList [TestLabel "test1" test1, TestLabel "test2" test2]

runTests :: IO Counts
runTests = do 
        _ <-runTestTT firstTest
        runTestTT firstTest

main :: IO Counts
main = runTests