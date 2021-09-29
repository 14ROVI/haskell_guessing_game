import System.Random

main = do
  putStrLn "This is a random number guesser game."
  putStrLn "The number will be between 0 and 1000."
  generator <- newStdGen
  let target_num = fst (randomR (0 :: Int, 1000 :: Int) generator)
  guessing_game target_num

guessing_game :: Int -> IO ()
guessing_game target_num = do
  putStr "Guess: "
  guessed <- readLn
  if guessed == target_num then
    putStrLn "You got the number! Well done :)"
  else if guessed > target_num then do
    putStrLn "Your guess was too high."
    guessing_game target_num
  else do
    putStrLn "Your guess was too low."
    guessing_game target_num
