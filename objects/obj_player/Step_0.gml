//Pegando inputs
var _right = global.inputs.right || global.gp_inputs.gp_right
var _left = global.inputs.left || global.gp_inputs.gp_left
var _jump = global.inputs.space || global.gp_inputs.gp_face1

if(_right || _left) spd = spd_max

//Aplicando na movimentação
hspd = (_right - _left) * spd

//Herdando o evento
event_inherited();