// Set tray positions

var yPos = 559;
var xPos = 849;
var xDiff = 85;

var dispensers = instance_create(xPos + xDiff * 0,yPos,verticalTray);
dispensers.button.sprite_index = B_Dispenser_spr;

var receivers = instance_create(xPos + xDiff * 1,yPos,verticalTray);
receivers.button.sprite_index = B_Receiver_spr;

var attachers = instance_create(xPos + xDiff * 2,yPos,verticalTray);
attachers.button.sprite_index = B_Attacher_spr;

var modifiers = instance_create(xPos + xDiff * 3,yPos,verticalTray);
modifiers.button.sprite_index = B_Modifier_spr;

var conveyors = instance_create(xPos + xDiff * 4,yPos,verticalTray);
conveyors.button.sprite_index = B_Conveyor_spr;

// Set button positions
yPos = 610;
xPos = 250;
xDiff = 150;

var recipes = instance_create(xPos + xDiff * 0,yPos,hudButton);
recipes.sprite_index = B_Recipe_spr;
recipes.nameSprite = B_Recipe_Name_spr;

var letters = instance_create(xPos + xDiff * 1,yPos,hudButton);
letters.sprite_index = B_Letter_spr;
letters.nameSprite = B_Letter_Name_spr;
