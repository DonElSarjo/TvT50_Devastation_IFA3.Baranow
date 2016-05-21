/*
	ArmA 3 TAW View Distance Management
	Resource Definesby Sa-Matra
*/
class RIP_RscMapControl
{
	access = 0;
	alphaFadeEndScale = 2;
	alphaFadeStartScale = 2;
	colorBackground[] = {0.969,0.957,0.949,1};
	colorCountlines[] = {0.572,0.354,0.188,0.25};
	colorCountlinesWater[] = {0.491,0.577,0.702,0.3};
	colorForest[] = {0.624,0.78,0.388,0.5};
	colorForestBorder[] = {0,0,0,0};
	colorGrid[] = {0.1,0.1,0.1,0.6};
	colorGridMap[] = {0.1,0.1,0.1,0.6};
	colorInactive[] = {1,1,1,0.5};
	colorLevels[] = {0.286,0.177,0.094,0.5};
	colorMainCountlines[] = {0.572,0.354,0.188,0.5};
	colorMainCountlinesWater[] = {0.491,0.577,0.702,0.6};
	colorMainRoads[] = {0.9,0.5,0.3,1};
	colorMainRoadsFill[] = {1,0.6,0.4,1};
	colorNames[] = {0.1,0.1,0.1,0.9};
	colorOutside[] = {0,0,0,1};
	colorPowerLines[] = {0.1,0.1,0.1,1};
	colorRailWay[] = {0.8,0.2,0,1};
	colorRoads[] = {0.7,0.7,0.7,1};
	colorRoadsFill[] = {1,1,1,1};
	colorRocks[] = {0,0,0,0.3};
	colorRocksBorder[] = {0,0,0,0};
	colorSea[] = {0.467,0.631,0.851,0.5};
	colorText[] = {0,0,0,1};
	colorTracks[] = {0.84,0.76,0.65,0.15};
	colorTracksFill[] = {0.84,0.76,0.65,1};
	deletable = 0;
	fade = 0;
	font = "TahomaB";
	fontGrid = "TahomaB";
	fontInfo = "PuristaMedium";
	fontLabel = "PuristaMedium";
	fontLevel = "TahomaB";
	fontNames = "EtelkaNarrowMediumPro";
	fontUnits = "TahomaB";
	h = "SafeZoneH - 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	idc = 51;
	maxSatelliteAlpha = 0.85;
	moveOnEdges = 1;
	ptsPerSquareCLn = 10;
	ptsPerSquareCost = 10;
	ptsPerSquareExp = 10;
	ptsPerSquareFor = 9;
	ptsPerSquareForEdge = 9;
	ptsPerSquareObj = 9;
	ptsPerSquareRoad = 6;
	ptsPerSquareSea = 5;
	ptsPerSquareTxt = 20;
	scaleDefault = 0.16;
	scaleMax = 1;
	scaleMin = 0.001;
	shadow = 0;
	showCountourInterval = 0;
	sizeEx = 0.04;
	sizeExGrid = 0.02;
	sizeExInfo = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	sizeExLabel = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	sizeExLevel = 0.02;
	sizeExNames = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8) * 2";
	sizeExUnits = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
	stickX[] = {0.2,["Gamma",1,1.5]};
	stickY[] = {0.2,["Gamma",1,1.5]};
	style = 48;
	text = "#(argb,8,8,3)color(1,1,1,1)";
	type = 101;
	w = "SafeZoneWAbs";
	x = "SafeZoneXAbs";
	y = "SafeZoneY + 1.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";

	class ActiveMarker {
		color[] = {0.3,0.1,0.9,1};
		size = 50;
	};

	class Legend {
		color[] = {0,0,0,1};
		colorBackground[] = {1,1,1,0.5};
		font = "PuristaMedium";
		h = "3.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
		sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
		w = "10 * 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		x = "SafeZoneX + 					(			((safezoneW / safezoneH) min 1.2) / 40)";
		y = "SafeZoneY + safezoneH - 4.5 * 					(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
	};

	class Bunker {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = "1.5 * 14 * 0.05";
		size = 14;
	};

	class Bush {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = "0.2 * 14 * 0.05 * 0.05";
		size = "14/2";
	};

	class BusStop {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\busstop_CA.paa";
		importance = 1;
		size = 24;
	};

	class Command {
		coefMax = 1;
		coefMin = 1;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance = 1;
		size = 18;
	};

	class CustomMark {
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\custommark_ca.paa";
		importance = 1;
		size = 24;
	};

	class Cross {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Cross_CA.paa";
		importance = 1;
		size = 24;
	};

	class Shipwreck {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Shipwreck_CA.paa";
		importance = 1;
		size = 24;
	};

	class Fortress {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\bunker_ca.paa";
		importance = "2 * 16 * 0.05";
		size = 16;
	};

	class Fuelstation {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fuelstation_CA.paa";
		importance = 1;
		size = 24;
	};

	class Fountain {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\fountain_ca.paa";
		importance = "1 * 12 * 0.05";
		size = 11;
	};

	class Hospital {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\hospital_CA.paa";
		importance = 1;
		size = 24;
	};

	class Chapel {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\Chapel_CA.paa";
		importance = 1;
		size = 24;
	};

	class Church {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\church_CA.paa";
		importance = 1;
		size = 24;
	};

	class Lighthouse {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\lighthouse_CA.paa";
		importance = 1;
		size = 24;
	};

	class Quay {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\quay_CA.paa";
		importance = 1;
		size = 24;
	};

	class Rock {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.1,0.1,0.1,0.8};
		icon = "\A3\ui_f\data\map\mapcontrol\rock_ca.paa";
		importance = "0.5 * 12 * 0.05";
		size = 12;
	};

	class Ruin {
		coefMax = 4;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\ruin_ca.paa";
		importance = "1.2 * 16 * 0.05";
		size = 16;
	};

	class SmallTree {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = "0.6 * 12 * 0.05";
		size = 12;
	};

	class Stack {
		coefMax = 4;
		coefMin = 0.9;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\stack_ca.paa";
		importance = "2 * 16 * 0.05";
		size = 20;
	};

	class Tree {
		coefMax = 4;
		coefMin = 0.25;
		color[] = {0.45,0.64,0.33,0.4};
		icon = "\A3\ui_f\data\map\mapcontrol\bush_ca.paa";
		importance = "0.9 * 16 * 0.05";
		size = 12;
	};

	class Task {
		coefMax = 1;
		coefMin = 1;
		color[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
		colorCanceled[] = {0.7,0.7,0.7,1};
		colorCreated[] = {1,1,1,1};
		colorDone[] = {0.7,1,0.3,1};
		colorFailed[] = {1,0.3,0.2,1};
		icon = "\A3\ui_f\data\map\mapcontrol\taskIcon_CA.paa";
		iconCanceled = "\A3\ui_f\data\map\mapcontrol\taskIconCanceled_CA.paa";
		iconCreated = "\A3\ui_f\data\map\mapcontrol\taskIconCreated_CA.paa";
		iconDone = "\A3\ui_f\data\map\mapcontrol\taskIconDone_CA.paa";
		iconFailed = "\A3\ui_f\data\map\mapcontrol\taskIconFailed_CA.paa";
		importance = 1;
		size = 27;
	};

	class Tourism {
		coefMax = 4;
		coefMin = 0.7;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\tourism_ca.paa";
		importance = "1 * 16 * 0.05";
		size = 16;
	};

	class Transmitter {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\transmitter_CA.paa";
		importance = 1;
		size = 24;
	};

	class ViewTower {
		coefMax = 4;
		coefMin = 0.5;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\viewtower_ca.paa";
		importance = "2.5 * 16 * 0.05";
		size = 16;
	};

	class Watertower {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\watertower_CA.paa";
		importance = 1;
		size = 24;
	};

	class power {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\power_CA.paa";
		importance = 1;
		size = 24;
	};

	class powersolar {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\powersolar_CA.paa";
		importance = 1;
		size = 24;
	};

	class powerwave {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\powerwave_CA.paa";
		importance = 1;
		size = 24;
	};

	class powerwind {
		coefMax = 1;
		coefMin = 0.85;
		color[] = {1,1,1,1};
		icon = "\A3\ui_f\data\map\mapcontrol\powerwind_CA.paa";
		importance = 1;
		size = 24;
	};

	class Waypoint {
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypoint_ca.paa";
		importance = 1;
		size = 24;
	};

	class WaypointCompleted {
		coefMax = 1;
		coefMin = 1;
		color[] = {0,0,0,1};
		icon = "\A3\ui_f\data\map\mapcontrol\waypointCompleted_ca.paa";
		importance = 1;
		size = 24;
	};
};

class RIP_RscShortcutButton {
	idc = -1;
	style = 0;
	default = 0;
	shadow = 1;
	w = 0.183825;
	h = "(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20)";
	color[] = {1,1,1,1.0};
	colorFocused[] = {1,1,1,1.0};
	color2[] = {0.95,0.95,0.95,1};
	colorDisabled[] = {1,1,1,0.25};
	colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackgroundFocused[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
	colorBackground2[] = {1,1,1,1};
	animTextureDefault = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureNormal = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureDisabled = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\normal_ca.paa";
	animTextureOver = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\over_ca.paa";
	animTextureFocused = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\focus_ca.paa";
	animTexturePressed = "\A3\ui_f\data\GUI\RscCommon\RscShortcutButton\down_ca.paa";
	periodFocus = 1.2;
	periodOver = 0.8;
	class HitZone
	{
		left = 0.0;
		top = 0.0;
		right = 0.0;
		bottom = 0.0;
	};
	class ShortcutPos
	{
		left = 0;
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		w = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		h = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	};
	class TextPos
	{
		left = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1) * (3/4)";
		top = "(			(		(		((safezoneW / safezoneH) min 1.2) / 1.2) / 20) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	period = 0.4;
	font = "PuristaMedium";
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
	action = "";
	class Attributes
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
		shadow = "true";
	};
	class AttributesImage
	{
		font = "PuristaMedium";
		color = "#E5E5E5";
		align = "left";
	};
};

class RIP_RscText {
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	type = 0;
	style = 0;
	shadow = 1;
	colorShadow[] = {0, 0, 0, 0.5};
	font = "PuristaMedium";
	SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	text = "";
	colorText[] = {1, 1, 1, 1.0};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
};

class RIP_RscTitle : RIP_RscText {
	style = 0;
	shadow = 0;
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	colorText[] = {0.95, 0.95, 0.95, 1};
};

class RIP_RscButtonMenu : RIP_RscShortcutButton {
	idc = -1;
	type = 16;
	style = "0x02 + 0xC0";
	default = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.095589;
	h = 0.039216;
	animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
	animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
	animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
	colorBackground[] = {0,0,0,0.8};
	colorBackgroundFocused[] = {1,1,1,1};
	colorBackground2[] = {0.75,0.75,0.75,1};
	color[] = {1,1,1,1};
	colorFocused[] = {0,0,0,1};
	color2[] = {0,0,0,1};
	colorText[] = {1,1,1,1};
	colorDisabled[] = {1,1,1,0.25};
	period = 1.2;
	periodFocus = 1.2;
	periodOver = 1.2;
	size = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	sizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	class TextPos
	{
		left = "0.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)";
		top = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) - 		(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)) / 2";
		right = 0.005;
		bottom = 0.0;
	};
	class Attributes
	{
		font = "PuristaLight";
		color = "#E5E5E5";
		align = "left";
		shadow = "false";
	};
	class ShortcutPos
	{
		left = "(6.25 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.0225 - 0.005";
		top = 0.005;
		w = 0.0225;
		h = 0.03;
	};
	soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
	soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
	soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
	soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
	textureNoShortcut = "";
};

class RIP_RscXSliderH
{
	style = 1024;
	type = 43;
	shadow = 2;
	x = 0;
	y = 0;
	h = 0.029412;
	w = 0.400000;
	color[] = {
			1, 1, 1, 0.7
	};
	colorActive[] = {
			1, 1, 1, 1
	};
	colorDisabled[] = {
			1, 1, 1, 0.500000
	};
	arrowEmpty = "\A3\ui_f\data\gui\cfg\slider\arrowEmpty_ca.paa";
	arrowFull = "\A3\ui_f\data\gui\cfg\slider\arrowFull_ca.paa";
	border = "\A3\ui_f\data\gui\cfg\slider\border_ca.paa";
	thumb = "\A3\ui_f\data\gui\cfg\slider\thumb_ca.paa";
};

class RIP_activeText
{
	idc = -1;
	type = 11;
	style = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	sizeEx = 0.040;
	font = "PuristaLight";
	color[] = {1, 1, 1, 1};
	colorActive[] = {1, 0.2, 0.2, 1};
	colorDisabled[] = {1,1,1,0.25};
	soundEnter[] = {"\A3\ui_f\data\sound\onover", 0.09, 1};
	soundPush[] = {"\A3\ui_f\data\sound\new1", 0.0, 0};
	soundClick[] = {"\A3\ui_f\data\sound\onclick", 0.07, 1};
	soundEscape[] = {"\A3\ui_f\data\sound\onescape", 0.09, 1};
	action = "";
	text = "";
};

class RIP_ScrollBar
{
    color[] = {1,1,1,0.6};
    colorActive[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,0.3};
    thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
    arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
    arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
    border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
    shadow = 0;
    scrollSpeed = 0.06;
    width = 0;
    height = 0;
    autoScrollEnabled = 1;
    autoScrollSpeed = -1;
    autoScrollDelay = 5;
    autoScrollRewind = 0;
};

class RIP_RscListBox
{
	type = 5;
	style = 16;
	w = 0.275;
	h = 0.04;
	font = "PuristaMedium";
	sizeEx = 0.035;
	shadow = 0;
	colorShadow[] = {0,0,0,0.5};
	colorText[] = {1,1,1,1.0};
	colorDisabled[] = {1,1,1,0.25};
	colorScrollbar[] = {1,0,0,0};
	colorSelect[] = {0,0,0,1};
	colorSelect2[] = {0,0,0,1};
	colorSelectBackground[] = {0.95,0.95,0.95,1};
	colorSelectBackground2[] = {1,1,1,0.5};
	period = 1.2;
	colorBackground[] = {0,0,0,0.3};
	maxHistoryDelay = 1.0;
	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1};
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	rowHeight = 0;
	autoScrollSpeed = -1;
	autoScrollDelay = 5;
	autoScrollRewind = 0;
	wholeHeight = 0.45;

	colorPicture[] = {1,1,1,1};
	colorPictureSelected[] = {1,1,1,1};
	colorPictureDisabled[] = {1,1,1,1};
	colorPictudeDisabled[] = {1,1,1,0.25};

	class ListScrollBar : RIP_ScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RIP_RscCombo {
	idc = -1;
	type = 4;
	style = 1;
	x = 0;
	y = 0;
	w = 0.3;
	h = 0.035;
	colorSelect[] = {0.023529, 0, 0.0313725, 1};
	colorText[] = {0.023529, 0, 0.0313725, 1};
	colorBackground[] = {0.95, 0.95, 0.95, 1};
	colorSelectBackground[] = {0.543, 0.5742, 0.4102, 1.0};
	colorScrollbar[] = {0.023529, 0, 0.0313725, 1};
	arrowEmpty = "\ca\ui\data\ui_arrow_combo_ca.paa";
	arrowFull = "\ca\ui\data\ui_arrow_combo_active_ca.paa";
	wholeHeight = 0.45;
	color[] = {0, 0, 0, 0.6};
	colorDisabled[] = {};
	colorActive[] = {0, 0, 0, 1};
	font = "puristaMedium";
	sizeEx = 0.031;
	soundSelect[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundExpand[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	soundCollapse[] = {"\ca\ui\data\sound\new1", 0.09, 1};
	maxHistoryDelay = 1.0;

	class ComboScrollBar : RIP_ScrollBar
	{
		color[] = {1,1,1,1};
		autoScrollEnabled = 1;
		colorActive[] = {1, 1, 1, 1};
		colorDisabled[] = {1, 1, 1, 0.3};
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa";
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa";
		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa";
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa";
	};
};

class RIP_RscPicture
{
	shadow = 0;
	colorText[] = {1,1,1,1};
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
	tooltipColorText[] = {1,1,1,1};
	tooltipColorBox[] = {1,1,1,1};
	tooltipColorShade[] = {0,0,0,0.65};
	font = "PuristaMedium";
	sizeEx = 0.031;
};

class RIP_RscProgressBar
{
	access = 0;
	idc = -1;
	type = 8;
	style = 0;
	colorFrame[] = {0, 0, 0, 1};
	colorBar[] = {1, 1, 1, 1};
	texture = "";
	font = "puristaMedium";
	sizeEx = 0;
	lineSpacing = 0;
	text = "";
	fixedWidth = 0;
	shadow = 0;
	x = 0;
	y = 0;
	w = 0.2;
	h = 0.15;
};

class RIP_OPTIONS
{
	idd = 2900;
	name= "rip_options";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class RIP_RscSettingsTitleBackground:RIP_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = $STR_RIP_DLGSETTINGS;
			x = 0.3;
			y = 0.16;
			w = 0.5;
			h = 0.04;
		};

		class RIP_RscTitleBackground:RIP_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = $STR_RIP_DLGVIEWDISTANCE;
			x = 0.3;
			y = 0.204;
			w = 0.5;
			h = 0.04;
		};

		class MainBackground : RIP_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.244;
			w = 0.5;
			h = 0.432;
		};

		class RIP_OPTIONS_GrassLayer : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLGGRASSLAYER;
			shadow = 0;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.30;
			y = 0.31;
			w = 0.5;
			h = 0.04;
		};

		class RIP_OPTIONS_3DMarkers : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLG3DMARKERPLAYER;
			shadow = 0;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.30;
			y = 0.40;
			w = 0.5;
			h = 0.04;
		};

		class RIP_OPTIONS_PlayerMarkers : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLGMARKERSPLAYER;
			shadow = 0;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.30;
			y = 0.49;
			w = 0.5;
			h = 0.04;
		};

		class RIP_OPTIONS_VehicleMarkers : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLGMARKERSVEHICLES;
			shadow = 0;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			x = 0.30;
			y = 0.58;
			w = 0.5;
			h = 0.04;
		};
	};

	class controls
	{
		class RIP_OPTIONS_ViewDistance_slider : RIP_RscXSliderH
		{
			idc = 2901;
			text = "";
			x = 0.31;
			y = 0.26;
			w = 0.4;
			h = 0.04;
		};

		class RIP_OPTIONS_ViewDistance_value : RIP_RscText
		{
			idc = 2902;
			text = "";
			x = 0.73;
			y = 0.258;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_Grass_none : RIP_activeText
		{
			idc = 2903;
			text = $STR_RIP_DLGDISABLE;
			action = "setTerrainGrid 50";
			sizeEx = 0.04;
			x = 0.38;
			y = 0.345;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_Grass_low : RIP_activeText
		{
			idc = 2904;
			text = $STR_RIP_DLGLOW;
			action = "setTerrainGrid 30";
			sizeEx = 0.04;
			x = 0.47;
			y = 0.345;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_Grass_normal : RIP_activeText
		{
			idc = 2905;
			text = $STR_RIP_DLGNORMAL;
			action = "setTerrainGrid 12.5";
			sizeEx = 0.04;
			x = 0.56;
			y = 0.345;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_Grass_high : RIP_activeText
		{
			idc = 2906;
			text = $STR_RIP_DLGHIGHT;
			action = "setTerrainGrid 3.125";
			sizeEx = 0.04;
			x = 0.67;
			y = 0.345;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_3Dmarkers_none : RIP_activeText
		{
			idc = 2907;
			text = $STR_RIP_DLGDISABLE;
			action = "removeAllMissionEventHandlers 'Draw3D';RIP_3DMARKERSON = false;RIP_PLAYERSTAGSHANDLE = [] spawn RIP_fnc_PlayerTags;";
			sizeEx = 0.04;
			x = 0.38;
			y = 0.435;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_3Dmarkers_marker : RIP_activeText
		{
			idc = 2908;
			text = $STR_RIP_DLGMARKERS;
			action = "RIP3DMARKERMODE = 1;if !(RIP_3DMARKERSON) then {addMissionEventHandler ['Draw3D',{ [] call RIP_fnc_Player3DTags; }];};";
			sizeEx = 0.04;
			x = 0.47;
			y = 0.435;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_3Dmarkers_names : RIP_activeText
		{
			idc = 2909;
			text = $STR_RIP_DLGNAMES;
			action = "RIP3DMARKERMODE = 2;if !(RIP_3DMARKERSON) then {addMissionEventHandler ['Draw3D',{ [] call RIP_fnc_Player3DTags; }];};";
			sizeEx = 0.04;
			x = 0.56;
			y = 0.435;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_markers_playeroff : RIP_activeText
		{
			idc = 2910;
			text = $STR_RIP_DLGDISABLE;
			action = "RIP_PLAYERSMARKERSON = false;";
			sizeEx = 0.04;
			x = 0.38;
			y = 0.525;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_markers_playeron : RIP_activeText
		{
			idc = 2911;
			text = $STR_RIP_DLGENABLE;
			action = "[] spawn RIP_fnc_MarkersPlayer";
			sizeEx = 0.04;
			x = 0.47;
			y = 0.525;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_markers_vehicleoff : RIP_activeText
		{
			idc = 2912;
			text = $STR_RIP_DLGDISABLE;
			action = "RIP_VEHICLESMARKERSON = false;";
			sizeEx = 0.04;
			x = 0.38;
			y = 0.616;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_markers_vehicleon : RIP_activeText
		{
			idc = 2913;
			text = $STR_RIP_DLGENABLE;
			action = "[] spawn RIP_fnc_MarkersVehicles";
			sizeEx = 0.04;
			x = 0.47;
			y = 0.616;
			w = 0.275;
			h = 0.04;
		};

		class RIP_OPTIONS_ButtonClose : RIP_RscButtonMenu
		{
			idc = -1;
			text = $STR_RIP_DLGAPPLY;
			onButtonClick = "closeDialog 0;";
			x = 0.48;
			y = 0.68;
			w = 0.16;
			h = 0.04;
		};
	};
};

class RIP_TELEPORT
{
	idd = 4900;
	name= "rip_teleport";
	movingEnable = false;
	enableSimulation = true;
	onLoad="uiNamespace setVariable ['RIP_TELEPORTDIAL', _this select 0]";

	class controlsBackground {
		class RIP_RscSettingsTitleBackground:RIP_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = $STR_RIP_DLGTELEPORT;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.248 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.02625 * safezoneH;
		};

		class MainBackground : RIP_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.2375 * safezoneW + safezoneX;
			y = 0.276875 * safezoneH + safezoneY;
			w = 0.525 * safezoneW;
			h = 0.39375 * safezoneH;
		};

	};

	class controls
	{
		   class RIP_TELEPORT_Tooltip: RIP_RscText
		  {
 			idc = 4925;
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.3325 * safezoneW;
			h = 0.015 * safezoneH;
			text = "";
		};

		   class RIP_TELEPORT_Map: RIP_RscMapControl
		  {
 			idc = 4924;
			x = 0.4125 * safezoneW + safezoneX;
			y = 0.303125 * safezoneH + safezoneY;
			w = 0.3325 * safezoneW;
			h = 0.34125 * safezoneH;
			onMouseButtonClick = "[_this] execVM 'scripts\Teleporting.sqf';";
		};

		class RIP_TELEPORT_ButtonClose : RIP_RscButtonMenu {
			idc = 4923;
			text = $STR_RIP_DLGCLOSE;
			onButtonClick = "closeDialog 0;";
			x = 0.255 * safezoneW + safezoneX;
			y = 0.618125 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.02625 * safezoneH;
		};

		class RIP_TELEPORT_ButtonTeleportBase : RIP_RscButtonMenu {
			idc = 4920;
			text = $STR_RIP_DLGTELEPORTBASE;
			onButtonClick = "[0] execVM 'scripts\Teleporting.sqf';";
			x = 0.255 * safezoneW + safezoneX;
			y = 0.303125 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.02625 * safezoneH;
		};

		class RIP_TELEPORT_ButtonTeleportMHQ1 : RIP_RscButtonMenu {
			idc = 4921;
			text = $STR_RIP_DLGTELEPORTMHQ1;
			onButtonClick = "if (RIPPLAYERSIDE == 0) then {[EMHQ1,'RIP_TeleportMarkerMHQ1'] call RIP_fnc_UpdateTeleportMap} else {[WMHQ1,'RIP_TeleportMarkerMHQ1'] call RIP_fnc_UpdateTeleportMap};";
			x = 0.255 * safezoneW + safezoneX;
			y = 0.339875 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.02625 * safezoneH;
		};

		class RIP_TELEPORT_ButtonTeleportMHQ2 : RIP_RscButtonMenu {
			idc = 4922;
			text = $STR_RIP_DLGTELEPORTMHQ2;
			onButtonClick = "if (RIPPLAYERSIDE == 0) then {[EMHQ2,'RIP_TeleportMarkerMHQ2'] call RIP_fnc_UpdateTeleportMap} else {[WMHQ2,'RIP_TeleportMarkerMHQ2'] call RIP_fnc_UpdateTeleportMap};";
			x = 0.255 * safezoneW + safezoneX;
			y = 0.376625 * safezoneH + safezoneY;
			w = 0.15 * safezoneW;
			h = 0.02625 * safezoneH;
		};
	};
};

class RscTitles {

	class RIP_PLAYERTAG {
		idd=64432;
		fadein       =  0;
		fadeout      =  0;
		duration     =  1e+038;
		name		 = "RIP_PLAYERTAGTEXT";
		controls[]	 = { "RIP_PLAYERTAG_TEXT"};
		onLoad	 = "uiNamespace setVariable ['RIP_PLAYERTAG_TEXT', _this select 0]";
		class RIP_PLAYERTAG_TEXT {
			type 							= 13;
			idc 							= 64435;
			style 						= 0x00;
			x							= safeZoneX+safeZoneW/2;
			y 							= safeZoneY+safeZoneH/2;
			w 							= 0.25;
			h 							= 0.3;
			font 							= "PuristaMedium";
			size 							= 0.03;
			sizeEx						= 0.03;
			colorBackground[]	={ 0,0,0,0.0};
			text 							= "";
			class Attributes {
				font 				= "PuristaMedium";
				align 			= "center";
				valign 			= "middle";
				shadow 			= "1";
				shadowColor = "#000000";
				size 				= "1";
			};
		};
	};

	class RIP_VEHICLECREW {
		idd =64433;
		fadeout=0;
		fadein=0;
		duration = 1e+038;
		name= "RIP_VEHICLECREWTEXT";
		controls[]	 = { "RIP_VEHICLECREW_TEXT"};
		onLoad = "[_this select 0] spawn RIP_fnc_VehicleCrew";
		class RIP_VEHICLECREW_TEXT {
			type 							= 13;
			idc 							= 64436;
			style 						= 0x00;
			size 							= 0.03;
			sizeEx						= 0.03;
			x = "(((safezoneX + safezoneW) - 		(8.0 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))";
			y = "(safezoneY + 8.78 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
			w = "(8 * 			(			((safezoneW / safezoneH) min 1.2) / 40))";
			h = "(8 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 5))";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			text = "";
			class Attributes {
				font 				= "PuristaMedium";
				color 			= "#E5E5E5";
				align 			= "left";
				valign 			= "middle";
				shadow 			= "1";
				shadowColor = "#000000";
				size 				= "1";
			};
		};
	};

	class RIP_SCOREDISPLAY {
		idd =64434;
		fadeout=0;
		fadein=0;
		duration = 1e+038;
		name= "RIP_SCOREDISPLAYTEXT";
		controls[]	 = { "RIP_SCOREDISPLAY_TEXT"};
		onLoad = "[_this select 0] spawn RIP_fnc_ScoreDisplay";
		class RIP_SCOREDISPLAY_TEXT {
			type 							= 13;
			idc 							= 64437;
			style 						= 0x00;
			size 							= 0.03;
			sizeEx						= 0.03;
			x = "(((safezoneX + safezoneW) - 		(4.4 * 			(			((safezoneW / safezoneH) min 1.2) / 40)) - 0.5 * 			(			((safezoneW / safezoneH) min 1.2) / 40)))";
			y = "(safezoneY + 4.5 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25)))";
			w = "(4.7 * 			(			((safezoneW / safezoneH) min 1.2) / 40))";
			h = "(4.7 * 			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 5))";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			text = "";
			class Attributes {
				font 				= "PuristaMedium";
				color 			= "#E5E5E5";
				align 			= "center";
				valign 			= "middle";
				shadow 			= "1";
				shadowColor = "#000000";
				size 				= "1";
			};
		};
	};
};

class RIP_BUYVEHICLE
{
	idd = 5900;
	name= "rip_buyvehicle";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class RIP_RscSettingsTitleBackground:RIP_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = $STR_RIP_DLGBUYVEHICLE;
			x = 0.3;
			y = 0.16;
			w = 0.5;
			h = 0.04;
		};

		class MainBackground : RIP_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.204;
			w = 0.5;
			h = 0.462;
		};

		class RIP_BUYVEHICLE_AvailableVehicles : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLGAVAILABLEVEHICLES;
			x = 0.32;
			y = 0.2;
			w = 0.275;
			h = 0.04;
		};

		class RIP_BUYVEHICLE_Price : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLGPRICE;
			x = 0.65;
			y = 0.2;
			w = 0.275;
			h = 0.04;
		};

		class RIP_BUYVEHICLE_Money : RIP_RscText
		{
			idc = 5923;
			text = $STR_RIP_DLGMONEY;
			x = 0.305;
			y = 0.605;
			w = 0.275;
			h = 0.04;
		};
	};

	class controls
	{
		class RIP_BUYVEHICLE_Available_vehicle_list : RIP_RscListBox
		{
			idc = 5921;
			type = 102;
			style = LB_MULTI;
			drawSideArrows = 0;
			idcLeft = -1;
			idcRight = -1;
			maxHistoryDelay = 1;
			columns[] = {0.01,0.75};
			text = "";
			x = 0.31;
			y = 0.24;
			w = 0.48;
			h = 0.362;
		};

		class RIP_BUYVEHICLE_ButtonBuy : RIP_RscButtonMenu {
			idc = -1;
			text = $STR_RIP_DLGBUY;
			onButtonClick = "[] execVM 'Scripts\SpawnVehicles.sqf';";
			x = 0.58;
			y = 0.61;
			w = 0.165;
			h = 0.04;
		};

		class RIP_BUYVEHICLE_ButtonClose : RIP_RscButtonMenu {
			idc = -1;
			text = $STR_RIP_DLGCLOSE;
			onButtonClick = "closeDialog 0;";
			x = 0.48;
			y = 0.67;
			w = 0.165;
			h = 0.04;
		};
	};
};

class RIP_POINTSTRANSFER
{
	idd = 6900;
	name= "rip_pointstransfer";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground {
		class RIP_RscSettingsTitleBackground:RIP_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			text = $STR_RIP_DLGPOINTSTRANSFER;
			x = 0.3;
			y = 0.16;
			w = 0.4;
			h = 0.04;
		};

		class MainBackground : RIP_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.3;
			y = 0.204;
			w = 0.4;
			h = 0.242;
		};

		class RIP_POINTSTRANSFER_PlayersList : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLGWHICHPLAYER;
			x = 0.3;
		      y = 0.2;
			w = 0.37;
			h = 0.04;
		};

		class RIP_POINTSTRANSFER_Points : RIP_RscText
		{
			idc = -1;
			text = $STR_RIP_DLGPOINTSCOUNT;
			x = 0.3;
			y = 0.3;
			w = 0.37;
			h = 0.04;
		};

		class RIP_POINTSTRANSFER_SliderPoints : RIP_RscText
		{
			idc = 6902;
			text = "0";
			x = 0.638;
			y = 0.334;
			w = 0.275;
			h = 0.04;
		};
	};

	class controls
	{
		class RIP_POINTSTRANSFER_Available_vehicle_list : RIP_RscCombo
		{
			idc = 6921;
			text = "";
			x = 0.31;
			y = 0.24;
			w = 0.37;
			h = 0.03;
		};

		class RIP_POINTSTRANSFER_PointsCount_slider : RIP_RscXSliderH
		{
			idc = 6901;
			text = "";
			x = 0.31;
			y = 0.34;
			w = 0.32;
			h = 0.04;
		};

		class RIP_POINTSTRANSFER_ButtonTransfer : RIP_RscButtonMenu {
			idc = -1;
			text = $STR_RIP_DLGTRANSFER;
			onButtonClick = "[] execVM 'Scripts\TransferPoints.sqf';";
			x = 0.43;
			y = 0.39;
			w = 0.165;
			h = 0.04;
		};

		class RIP_POINTSTRANSFER_ButtonClose : RIP_RscButtonMenu {
			idc = -1;
			text = $STR_RIP_DLGCLOSE;
			onButtonClick = "closeDialog 0;";
			x = 0.43;
			y = 0.45;
			w = 0.165;
			h = 0.04;
		};
	};
};
