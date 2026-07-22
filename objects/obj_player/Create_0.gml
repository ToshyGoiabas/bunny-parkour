//Herdando o evento do meu "parent"
event_inherited();



			//Variaveis

depth = -1
image_blend = c_blue

spd_max = 2.6
spd = spd_max
spd_boost = 0.35
dir = 1
jump_impulse = -8
coyote_time = 0

movement = function()
{
	//Pegando inputs
	var _right = global.inputs.right || global.gp_inputs.gp_right
	var _left = global.inputs.left || global.gp_inputs.gp_left

	//Verifica se movimentei
	if(_right || _left)
	{
		//Aplica o boost de velocidade
		spd+=spd_boost
	
		if(spd >= spd_max) spd = spd_max
	
		//Define a direção
		if(_right) dir = 1
	
		else if(_left) dir = -1
	}

	else
	{
		//Para de mover
		spd = 0	
	}

	//Aplica a velocidade
	hspd = spd * dir	

	var _jump = global.inputs.space || global.gp_inputs.gp_face1
	var _jump_pressed = global.inputs.space_pressed || global.gp_inputs.gp_face1_pressed

	//Sistema de pulo
	var _on_ground = place_meeting(x,y+2,obj_colision)

	if(_on_ground) coyote_time = 0.1

	else coyote_time-=global.time

	//Pulo
	if(_jump_pressed && coyote_time > 0)
	{
		vspd = jump_impulse	
		coyote_time = 0
	}
}