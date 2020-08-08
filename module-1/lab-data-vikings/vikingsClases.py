import random
# Soldier
#class to define the soldier
class Soldier():
    #to include a lot of functions
    def __init__(self, health, strength):
        self.health = health
        self.strength = strength
      
    def attack(self):
        return self.strength

    def receiveDamage(self,x):
        self.health = self.health - x
# YA QUEDOOOOOO :D


# Harald the Viking
class Viking(Soldier):
    def __init__(self, name, health, strength):
        self.name = name
        self.health = health
        self.strength = strength
        
    def receiveDamage(self,x):
        self.health = self.health - x
        if self.health > 0:
            return f'{self.name} has received {x} points of damage'
        else:
            return f'{self.name} has died in act of combat'
        
    def battleCry(self):
        return "Odin Owns You All!"
# Y FUE A LA 3ERA, NO A LA PINCHESMIL!!! (como el pasado)


# Saxon
class Saxon(Soldier):
    def receiveDamage(self,x):
        self.health = self.health - x
        if self.health > 0:
            return f'A Saxon has received {x} points of damage'
        else:
            return f'A Saxon has died in combat'
# a. la. primera.
# .
# .
# .
# :''')



# War
class War():
    def __init__(self):
        self.vikingArmy = []
        self.saxonArmy = []

    def addViking(self, Viking):
        self.vikingArmy.append(Viking)
        
    def addSaxon(self, Saxon):
        self.saxonArmy.append(Saxon)
        
    def vikingAttack(self):
        a = random.choice(self.saxonArmy)
        v = random.choice(self.vikingArmy)
        b = a.receiveDamage(v.strength)

        if a.health <= 0:
            self.saxonArmy.remove(a)
            
        return b
        
    def saxonAttack(self):
        a = random.choice(self.vikingArmy)
        v = random.choice(self.saxonArmy)
        b = a.receiveDamage(v.strength)

        if a.health <= 0:
            self.vikingArmy.remove(a)
            
        return b

    def showStatus(self):
        if len(self.saxonArmy) !=0 and len(self.vikingArmy) != 0:
            return 'Vikings and Saxons are still in the thick of battle.'            
        elif len(self.saxonArmy) == 0:
            return 'Vikings have won the war of the century!'
        else:
            return 'Saxons have fought for their lives and survive another day...'


        
