//Gravidade forçada
if(!place_meeting(x,y+1,obj_colision))vspd+=grav

if(vspd >= grav_max) vspd = grav_max

//Faz a colisão
hspd = horizontal_colision(x,y,hspd,obj_colision)
vspd = vertical_colision(x,y,vspd,obj_colision)

//Aplica movimentação
x+=hspd
y+=vspd

x = round(x)

//Arredondar pra não gerar putarias
if(vspd > 0) y = round(y)