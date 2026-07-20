//Faz a colisão
hspd = horizontal_colision(x,y,hspd,obj_colision)
vspd = vertical_colision(x,y,vspd,obj_colision)

//Aplica movimentação
x+=hspd
y+=vspd

//Evita sub-pixel
y = round(y)