module Engineering.Mechanical where
import Types (Forca, Distancia, Angulo, Torque, VelocidadeAngular, Raio, Velocidade, Aceleracao, Energia, Altura, Massa)

calcularTorque :: Forca -> Distancia -> Angulo -> Torque
velocidadeAngular :: Velocidade -> Raio -> VelocidadeAngular
aceleracaocentripeta :: Velocidade -> Raio -> Aceleracao
energiaCinetica :: Massa -> Velocidade -> Energia
energiaPotencial :: Massa -> Altura -> Energia
centroMassaX :: [(Massa, Distancia)] -> Distancia