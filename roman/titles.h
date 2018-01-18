class default
{
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=0;
	fadein=0;
	duration = 0;

	class controlsBackground {};

	class controls
	{};
};

class countdown
{
	idd = -1;
	movingEnable = 1;
	enableSimulation = 1;
	fadeout=0.25;
	fadein=0.25;
	duration = 999999;
	onLoad = "uiNamespace setVariable ['countdown',_this select 0];";

	class controlsBackground {};

	class controls
	{
    class text: RscStructuredText
    {
    	idc = 1100;
    	text = ""; //--- ToDo: Localize;
    	x = 0.298906 * safezoneW + safezoneX;
    	y = 0.016 * safezoneH + safezoneY;
    	w = 0.402187 * safezoneW;
    	h = 0.077 * safezoneH;
    	colorBackground[] = {-1,-1,-1,0};
    };
	};
};
