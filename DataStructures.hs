module DataStructures where

data ArvoreBinaria a = Vazia | No a (ArvoreBinaria a) (ArvoreBinaria a)
                      deriving (Show, Eq)

quickSort :: (Ord a) => [a] -> [a] -- Ordenação rápida
mergeSort :: (Ord a) => [a] -> [a] -- Ordenação por intercalação
insertionSort :: (Ord a) => [a] -> [a] -- Ordenação por inserção