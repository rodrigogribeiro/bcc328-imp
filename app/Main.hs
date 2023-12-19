module Main (main) where

import System.Environment (getArgs)
import Imp.Frontend.Parser.Parser
import Imp.Interpreter.ImpInterpreter

main :: IO ()
main = do
  args <- getArgs
  runInterpreter args

printErrorMessage :: IO ()
printErrorMessage
  = do
       putStrLn "Usage"
       putStrLn "simple-imp <file>"

runInterpreter :: [String] -> IO ()
runInterpreter [arg1]
  = do
      content <- readFile arg1
      let ast = impParser content
      env <- interpProgram ast
      print env
runInterpreter _
  = printErrorMessage
