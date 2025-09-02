module LinearAlgebra where
import Types (Matriz, Vetor, Angulo)

somarMatrizes :: Matriz -> Matriz -> Maybe Matriz
multiplicarMatrizes :: Matriz -> Matriz -> Maybe Matriz
transpostaMatriz :: Matriz -> Matriz
determinante :: Matriz -> Maybe Double
resolverSistemaLinear :: Matriz -> Vetor -> Maybe Vetor
produtoEscalar :: Vetor -> Vetor -> Maybe Double
normaVetor :: Vetor -> Double
anguloEntreVetores :: Vetor -> Vetor -> Maybe Angulo