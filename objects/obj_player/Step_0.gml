//Pegando inputs
var _right = global.inputs.right || global.gp_inputs.gp_right
var _left = global.inputs.left || global.gp_inputs.gp_left
var _jump = global.inputs.space || global.gp_inputs.gp_face1
var _jump_pressed = global.inputs.space_pressed || global.gp_inputs.gp_face1_pressed

//Aplicando na movimentação
hspd = (_right - _left) * spd

if(place_meeting(x,y+2,obj_colision)) coyote_time = 0.25

else coyote_time-=global.time

//Pulo
if(_jump_pressed && coyote_time > 0)
{
	vspd = jump_impulse	
	coyote_time = 0
}

//Herdando o evento
event_inherited();