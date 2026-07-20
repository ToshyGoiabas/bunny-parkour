//Pegando inputs
var _right = global.inputs.right || global.gp_inputs.gp_right
var _left = global.inputs.left || global.gp_inputs.gp_left

//Aplicando na movimentação
hspd = (_right - _left) * spd

//Herdando o evento
event_inherited();