module Geometry where
import Types (Distancia, Ponto2D, Ponto3D, Perimetro, Figura, Volume, Area)

distanciaEntrePontos :: Ponto2D -> Ponto2D -> Distancia
distancia3D :: Ponto3D -> Ponto3D -> Distancia
pontoMedio :: Ponto2D -> Ponto2D -> Ponto2D
calcularArea :: Figura -> Area
calcularPerimetro :: Figura -> Perimetro
calcularVolume :: Figura -> Volume
dentroDoPoligono :: Ponto2D -> [Ponto2D] -> Bool
intersecaoRetas :: (Ponto2D, Ponto2D) -> (Ponto2D, Ponto2D) -> Maybe Ponto2D