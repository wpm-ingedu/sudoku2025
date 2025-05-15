import random
class Juego:
    armado,sudo,nivel=[],[],0
    def __init__(self,nivel):
        self.nivel=nivel
        self.iniciandoArmado()
        self.elJuego()    
    def iniciandoArmado(self):  
        self.armado=[]     
        lista=[1,2,3,4,5,6,7,8,9]
        random.shuffle(lista)
        nuevo=[]
        for i in range(9):
            numeros=[]
            for j in range(9):
                numeros.append(lista[j-i])
            nuevo.append(numeros)
        a=[nuevo[0],nuevo[3],nuevo[6]]        
        b=[nuevo[1],nuevo[4],nuevo[7]]
        c=[nuevo[2],nuevo[5],nuevo[8]]
        random.shuffle(a)
        random.shuffle(b)
        random.shuffle(c)
        baraja=[a,b,c]
        random.shuffle(baraja)
        self.armado.extend(baraja[0])
        self.armado.extend(baraja[1])
        self.armado.extend(baraja[2])
    def elJuego(self):
        self.sudo=[]
        dificultad=[[0,0,0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1,1,1],[0,0,0,0,0,1,1,1,1,1],[0,0,0,0,0,0,1,1,1,1],[0,0,0,0,0,0,0,1,1,1]]    
        for i in range(9):
            fila=[]
            for j in range(9):
                azar= random.randint(0,9)
                if dificultad[self.nivel][azar]==1:
                    fila.append(self.armado[i][j])
                else:
                    fila.append(0)
            self.sudo.append(fila)         

