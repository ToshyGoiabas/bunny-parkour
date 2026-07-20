//Atualiza a seed
randomise()

//Constante para valores nulos
#macro NULL -999

//Mexendo no tempo do jogo
global.time = delta_time / 1000000

#macro FRAMES 60

game_set_speed(FRAMES,gamespeed_fps)

/* Variavel que controla o "movimento" de como o 
jogo flui */
global.motion = 1

//Controle
global.gamepad = NULL

function gamepad_connect()
{
	//Procurando algum dispositivo conectado
	var _gamepad_slots = gamepad_get_device_count()
	
	for(var i = 0; i < _gamepad_slots; i++)
	{
		//Achou
		if(gamepad_is_connected(i)){global.gamepad = i; return true;}		
	}
	
	return false
}

//Variaveis para fazer o controle vibrar
global.gamepad_vib1 = 0
global.gamepad_vib2 = 0
global.gamepad_vib_time = 0
global.gamepad_is_vib = false

//NOTE: Colocar numero bruto no secondes
function gamepad_vibration(left_vib,right_vib,seconds)
{
	if(gamepad_connect())
	{
		//Convertendo pra escala de 1
		if(left_vib > 1) left_vib/=left_vib
	
		if(right_vib > 1) right_vib/=right_vib
	
		//Começa a vibrar
		global.gamepad_vib1 = left_vib
		global.gamepad_vib2 = right_vib
		global.gamepad_vib_time = seconds
		global.gamepad_is_vib = true
	}
}

//Funciton para vibração do gamepad
function gamepad_control_vibration()
{
	//Vibrar
	if(gamepad_connect()) gamepad_set_vibration(global.gamepad,global.gamepad_vib1,global.gamepad_vib2)
	
	if(global.gamepad_is_vib)
	{
		//Começa a perder time
		global.gamepad_vib_time-=global.delta_time
		
		//show_debug_message(global.gamepad_vib_time)
		
		if(global.gamepad_vib_time<=0) global.gamepad_is_vib = false
	}
	
	else
	{
		//Reseta
		global.gamepad_vib1 = 0
		global.gamepad_vib2 = 0
	}
}

//Zona morta do controle
global.gamepad_deadzone = 0.5

//Pegar TODOS os inputs do jogo
global.inputs = 
{}

global.gp_inputs =
{}

function update_game_inputs()
{
	//Atualiza os inputs normal
	global.inputs.right = max(keyboard_check(vk_right),keyboard_check(ord("D")))
	global.inputs.left = max(keyboard_check(vk_left),keyboard_check(ord("A")))
	global.inputs.space = keyboard_check(vk_space)
	
	//Atualiza do gamepad
	if(gamepad_connect())
	{
		global.gp_inputs.gp_right = gamepad_axis_value(global.gamepad,gp_axislh) > global.gamepad_deadzone
		global.gp_inputs.gp_left = gamepad_axis_value(global.gamepad,gp_axislh) < -global.gamepad_deadzone
		global.gp_inputs.gp_face1 = gamepad_button_check(global.gamepad,gp_face1)
	}
	
	else
	{
		global.gp_inputs.gp_right = NULL
		global.gp_inputs.gp_right = NULL
		global.gp_inputs.gp_left = NULL
		global.gp_inputs.gp_face1 = NULL
	}
}
