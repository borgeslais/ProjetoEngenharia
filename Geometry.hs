module Geometry where

import Types (Area, Distancia, Figura (..), Perimetro, Ponto2D (..), Ponto3D (..), Volume)

distanciaEntrePontos :: Ponto2D -> Ponto2D -> Distancia
distanciaEntrePontos (Ponto2D x1 y1) (Ponto2D x2 y2) =
  sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2)

distancia3D :: Ponto3D -> Ponto3D -> Distancia
distancia3D (Ponto3D x1 y1 z1) (Ponto3D x2 y2 z2) =
  sqrt ((x2 - x1) ^ 2 + (y2 - y1) ^ 2 + (z2 - z1) ^ 2)

pontoMedio :: Ponto2D -> Ponto2D -> Ponto2D
pontoMedio (Ponto2D x1 y1) (Ponto2D x2 y2) =
  Ponto2D ((x1 + x2) / 2) ((y1 + y2) / 2)

calcularArea :: Figura -> Area
calcularArea (Retangulo largura altura) = largura * altura
calcularArea (Circulo raio) = pi * raio ^ 2
calcularArea (Triangulo (Ponto2D x1 y1) (Ponto2D x2 y2) (Ponto2D x3 y3)) =
  let a = distanciaEntrePontos (Ponto2D x1 y1) (Ponto2D x2 y2)
      b = distanciaEntrePontos (Ponto2D x2 y2) (Ponto2D x3 y3)
      c = distanciaEntrePontos (Ponto2D x3 y3) (Ponto2D x1 y1)
      s = (a + b + c) / 2 -- Semi-perímetro
   in sqrt (s * (s - a) * (s - b) * (s - c)) -- Fórmula de Herão // TODO: EXPLICAR
calcularArea (Poligono pontos) =
  -- Algoritmo do shoelace para polígonos
  let n = length pontos
      shoelace =
        sum $
          zipWith
            ( \(Ponto2D x1 y1) (Ponto2D x2 y2) ->
                (x1 * y2) - (x2 * y1)
            )
            pontos
            (tail pontos ++ [head pontos])
   in abs shoelace / 2
calcularArea (Esfera raio) = 4 * pi * (raio ^ 2)
calcularArea (Cilindro raio altura) =
  2 * pi * raio * (raio + altura)
calcularArea (Paralelepipedo comprimento largura altura) =
  2 * (comprimento * largura + comprimento * altura + largura * altura)

calcularPerimetro :: Figura -> Perimetro
calcularPerimetro (Retangulo largura altura) = 2 * (largura + altura)
calcularPerimetro (Circulo raio) = 2 * pi * raio
calcularPerimetro (Triangulo p1 p2 p3) =
  let ladoA = distanciaEntrePontos p1 p2
      ladoB = distanciaEntrePontos p2 p3
      ladoC = distanciaEntrePontos p3 p1
   in ladoA + ladoB + ladoC

calcularVolume :: Figura -> Volume
calcularVolume (Esfera raio) = (4 / 3) * pi * (raio ^ 3)
calcularVolume (Cilindro raio altura) = pi * (raio ^ 2) * altura
calcularVolume (Paralelepipedo comprimento largura altura) = comprimento * largura * altura

-- Função auxiliar: verifica se um ponto está entre y1 e y2
entre :: Double -> Double -> Double -> Bool
entre y y1 y2 = (y1 > y) /= (y2 > y)

-- Recebe um ponto (Ponto2D) e uma lista de vértices ([Ponto2D]) que formam o polígono.
dentroDoPoligono :: Ponto2D -> [Ponto2D] -> Bool
dentroDoPoligono (Ponto2D px py) vertices =
  odd
    ( length
        [ ()
          | (Ponto2D x1 y1, Ponto2D x2 y2) <- zip vertices (tail (cycle vertices)),
            entre py y1 y2,
            px < (x2 - x1) * (py - y1) / (y2 - y1) + x1
        ]
    )

intersecaoRetas :: (Ponto2D, Ponto2D) -> (Ponto2D, Ponto2D) -> Maybe Ponto2D
intersecaoRetas
  (Ponto2D x1 y1, Ponto2D x2 y2)
  (Ponto2D x3 y3, Ponto2D x4 y4)
    | det == 0 = Nothing -- paralelas ou coincidentes
    | otherwise = Just (Ponto2D px py)
    where
      det = (x1 - x2) * (y3 - y4) - (y1 - y2) * (x3 - x4)
      px = ((x1 * y2 - y1 * x2) * (x3 - x4) - (x1 - x2) * (x3 * y4 - y3 * x4)) / det
      py = ((x1 * y2 - y1 * x2) * (y3 - y4) - (y1 - y2) * (x3 * y4 - y3 * x4)) / det