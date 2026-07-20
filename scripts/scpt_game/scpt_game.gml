//Função para colisão
///@method horizontal_colision(x,y,speed,object)
function horizontal_colision(_x,_y,spd,obj)
{
	//Pega colisão
	var _col = place_meeting(_x+spd,_y,obj)
	
	if(_col)
	{
		var _sign = sign(spd)
		
		while(!place_meeting(_x+_sign,_y,obj))
		{
			//Desconta pixel errado
			_x+=_sign	
		}
		
		//Reseta a velocidade
		spd = 0
	}
	
	return spd
}

function vertical_colision(_x,_y,spd,obj)
{
	//Pega colisão
	var _col = place_meeting(_x,_y+spd,obj)
	
	if(_col)
	{
		var _sign = sign(spd)
		
		while(!place_meeting(_x,_y+_sign,obj))
		{
			//Desconta pixel errado
			_y+=_sign	
		}
		
		//Reseta a velocidade
		spd = 0
	}
	
	return spd
}