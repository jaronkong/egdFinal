// Set tray positions

var yPos = 559;
var xPos = 849;
var xDiff = 85;

var dispenserContents = 0;
var dispenserSections = 0;
dispenserContents[ dispenserSections, 0 ] = dispenser; //Item
dispenserContents[ dispenserSections, 1 ] = 1;         //Quantity
dispenserSections++
var dispensers = verticalTrayCreate( xPos + xDiff * 0, yPos, dispenserContents, dispenserSections);
dispensers.button.sprite_index = B_Dispenser_spr;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
var receiverContents = 0;
var receiverSections = 0;
receiverContents[ receiverSections, 0 ] = receiver; //Item
receiverContents[ receiverSections, 1 ] = 1;         //Quantity
receiverSections++;
var receivers = verticalTrayCreate(xPos + xDiff * 1, yPos ,receiverContents, receiverSections);
receivers.button.sprite_index = B_Receiver_spr;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
var attacherContents = 0;
var attacherSections = 0;
attacherContents[ attacherSections, 0 ] = attacher; //Item
attacherContents[ attacherSections, 1 ] = -1;         //Quantity
attacherSections++;
attacherContents[ attacherSections, 0 ] = combiner;
attacherContents[ attacherSections, 1 ] = -1;
attacherSections++;
var attachers = verticalTrayCreate(xPos + xDiff * 2, yPos, attacherContents, attacherSections);
attachers.button.sprite_index = B_Attacher_spr;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
var modifierContents = 0;
var modifierSections = 0;
modifierContents[ modifierSections, 0 ] = modifier; //Item
modifierContents[ modifierSections, 1 ] = -1;         //Quantity
modifierSections++;
modifierContents[ modifierSections, 0 ] = pressurizer;
modifierContents[ modifierSections, 1 ] = -1;
modifierSections++;
var modifiers = verticalTrayCreate(xPos + xDiff * 3, yPos, modifierContents, modifierSections);
modifiers.button.sprite_index = B_Modifier_spr;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
var conveyorContents = 0;
var conveyorSections = 0;
conveyorContents[ conveyorSections, 0 ] = conveyorBelt; //Item
conveyorContents[ conveyorSections, 1 ] = -1;         //Quantity
conveyorSections++;
conveyorContents[ conveyorSections, 0 ] = conveyorBeltDouble;
conveyorContents[ conveyorSections, 1 ] = -1;
conveyorSections++;
var conveyors = verticalTrayCreate(xPos + xDiff * 4, yPos, conveyorContents, conveyorSections);
conveyors.button.sprite_index = B_Conveyor_spr;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
// Set button positions
yPos = 610;
xPos = 250;
xDiff = 150;

var recipes = instance_create(xPos + xDiff * 0,yPos,recipieBook);
//recipes.sprite_index = B_Recipe_spr;
//recipes.nameSprite = B_Recipe_Name_spr;

var letters = instance_create(xPos + xDiff * 1,yPos,hudButton);
letters.sprite_index = B_Letter_spr;
letters.nameSprite = B_Letter_Name_spr;
