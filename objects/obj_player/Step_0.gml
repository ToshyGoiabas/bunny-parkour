//Pegando inputs
var _right = global.inputs.right || global.gp_inputs.gp_right
var _left = global.inputs.left || global.gp_inputs.gp_left
var _jump = global.inputs.space || global.gp_inputs.gp_face1
var _jump_pressed = global.inputs.space_pressed || global.gp_inputs.gp_face1_pressed

//Verifica se movimentei
if(_right || _left)
{
	spd+=spd_boost
	
	if(spd >= spd_max) spd = spd_max
	
	if(_right) dir = 1
	
	else if(_left) dir = -1
}

else
{
	spd = 0	
}

//Aplica a velocidade
hspd = spd * dir

var _on_ground = place_meeting(x,y+3,obj_colision)

if(_on_ground) coyote_time = 0.25

else coyote_time-=global.time

//Pulo
if(_jump_pressed && coyote_time > 0)
{
	vspd = jump_impulse	
	coyote_time = 0
}

//Herdando o evento
event_inherited();