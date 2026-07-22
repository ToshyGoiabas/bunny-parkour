//Gravidade forçada
if(!place_meeting(x,y+1,obj_colision)) vspd+=grav

else
{
	if(vspd > 0) vspd = 0	
}

if(vspd >= grav_max) vspd = grav_max

//Colisão
if(place_meeting(x+hspd,y,obj_colision))
{
	while(!place_meeting(x+sign(hspd),y,obj_colision))
	{
		x+=sign(hspd)
	}
	
	hspd = 0
}

if(place_meeting(x,y+vspd,obj_colision))
{
	while(!place_meeting(x,y+sign(vspd),obj_colision))
	{
		y+=sign(vspd)	
	}
	
	vspd = 0
}

//Aplica movimentação
x+=hspd
y+=vspd

//Arredonda pra nao ter putaria
x = round(x)
y = round(y)

x = clamp(x,0,room_width)