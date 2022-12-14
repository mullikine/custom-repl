module EvaluatorExamples where

import           Data.Char
import           Data.List

-- Some simple evaluator examples:


-- Capitalizes each word in the given input
capitalizer :: String -> String
capitalizer =
  unwords . map capitalize . words
  where capitalize (h:t) = toUpper h : (toLower <$> t)
        capitalize _     = []


-- Does really really simple calculations
simpleCalc :: String -> String
simpleCalc expr =
  case words expr of
    [x, "+", y] -> show $ read x + read y
    [x, "-", y] -> show $ read x - read y
    [x, "*", y] -> show $ read x * read y
    [x, "/", y] -> show $ read x / read y
    _           -> "That's too hard! :("


-- Finds emojis related to the given input
emojiFinder :: String -> String
emojiFinder expr
  | foundIn ["smile", "face"] = "π  π  π  π  π  π  π"
  | foundIn ["car", "transport"] = "π  π  π  π  π  π"
  | foundIn ["cat", "meow", "purr"] = "πΊ  πΈ  π»  πΌ  π"
  | foundIn ["ball", "sport"] = "β½οΈ  π  π  βΎοΈ  πΎ  π±"
  | foundIn ["food"] = "π  π  π  π  π  π  π  π  π  π  π"
  | otherwise = "πΎ  βοΈ"
  where foundIn  = not . null . intersect keywords
        keywords = words expr
