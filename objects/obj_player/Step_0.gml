#region Controles
//key_right = keyboard_check(ord("D"))//direita
//key_left = keyboard_check(ord("A"))//esquerda
key_right = keyboard_check(vk_right)//direita
key_left = keyboard_check(vk_left)//esquerda
key_jump = keyboard_check(ord("Z"))//pular
key_shoot = keyboard_check_pressed(ord("X")) //atira
#endregion

#region Movimentação
//inverte sprite para esquerda
var move  = key_right - key_left
hspd = move * spd;
vspd = vspd + grv;
if (hspd != 0) image_xscale = sign(hspd);


//Colisão Horizontal
if place_meeting(x+hspd,y,obj_wall)
{
	while(!place_meeting(x+sign(hspd),y,obj_wall))
	{
	x = x + sign(hspd)
	}
	hspd = 0;
}
x = x + hspd;


//Colisão Vertical
if place_meeting(x,y+vspd,obj_wall)
{
	while(!place_meeting(x,y+sign(vspd),obj_wall))
	{
	y = y + sign(vspd)
	}
	vspd = 0;
}
y = y + vspd;


//Pulo
if place_meeting(x,y+1,obj_wall) and key_jump
{
	vspd -= 12;
}
#endregion

#region Tiros

var flipped = direction;
var gun_x = (x+4)*(flipped)
var _xx = x + lengthdir_x(30, image_angle)
var y_offset = lengthdir_y(-20, image_angle)

if key_shoot and global.bullets > 0
{
	with (instance_create_layer(_xx,y+10,"Shoot",obj_shoot)){
		global.bullets --;
		//Velocidade
		speed = 10;
		//Direção
		direction = -90 + 90 * other.image_xscale;
		//Ângulo
		image_angle = direction;
	}
}


#endregion