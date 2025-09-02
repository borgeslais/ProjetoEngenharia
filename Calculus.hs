module Calculus where
import Types (Funcao, Comprimento)

avaliarFuncao :: Funcao -> Double -> Double
derivadaNumerica :: Funcao -> Double -> Double
integralNumerica :: Funcao -> Double -> Double -> Int -> Double
encontrarRaizes :: Funcao -> Double -> Double -> [Double]
encontrarMaximo :: Funcao -> Double -> Double -> Maybe Double
encontrarMinimo :: Funcao -> Double -> Double -> Maybe Double
calcularComprimentoCurva :: Funcao -> Double -> Double -> Comprimento