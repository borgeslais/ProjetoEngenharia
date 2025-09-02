module Engineering.Civil where
import Types (MomentoInercia, Altura, Largura, Area, Forca, Distancia, Comprimento, ModuloElasticidade, Pressao, Volume, Figura)

momentoInerciaRetangular :: Largura -> Altura -> MomentoInercia
tensaoNormal :: Forca -> Area -> Pressao
deflexaoViga :: Forca -> Comprimento -> ModuloElasticidade -> MomentoInercia -> Distancia
cargaCriticaEuler :: ModuloElasticidade -> MomentoInercia -> Comprimento -> Forca
volumeConcreto :: Figura -> Volume