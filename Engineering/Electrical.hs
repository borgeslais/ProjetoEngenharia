module Engineering.Electrical where
import Types (Resistencia, Tensao, PotenciaEletrica, Corrente, Impedancia, Reatancia, Angulo)

tensaoOhm :: Corrente -> Resistencia -> Tensao
potenciaEletricaVI :: Tensao -> Corrente -> PotenciaEletrica
potenciaEletricaRI :: Resistencia -> Corrente -> PotenciaEletrica
potenciaEletricaVR :: Tensao -> Resistencia -> PotenciaEletrica
resistenciaSerie :: [Resistencia] -> Resistencia
resistenciaParalelo :: [Resistencia] -> Resistencia
impedanciaAC :: Resistencia -> Reatancia -> Impedancia
polarParaRetangular :: Double -> Angulo -> (Double, Double)
retangularParaPolar :: Double -> Double -> (Double, Angulo)