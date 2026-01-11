{
  "layer": "top",
  "position": "top",
  "height" : 37,
  "width" : 1400,
  "margin-left": 50,
"margin-right": 50,
"margin-top":6,
"margin-bottom":1,

  "fixed-center": true,
  "reload_style_on_change": true,
  "include": ["~/.config/waybar/modules"],
  "modules-left": [
    "custom/menu",
    "group/demo2",
    "custom/separator#blank",
    "group/info",
  ],
  
  "modules-center": [
    "hyprland/workspaces#kanji"
  ],

  "modules-right": [
  "group/demo",
   "clock",
   "custom/power",
    
  ],

  "hyprland/workspaces#kanji": {
	"disable-scroll": true,
	"show-special": false,
	"all-outputs": true,
	"format": "{icon}",
    "persistent-workspaces": {
      "*": 5
	},
	"format-icons": {
		"1": "一",
		"2": "二",
		"3": "三",
		"4": "四",
		"5": "五",
		"6": "六",
		"7": "七",
		"8": "八",
		"9": "九",
		"10": "十",
	}
},

  "group/demo2": {
    "orientation": "inherit",
    "modules": [ "group/custom_right2"],
    },

"group/custom_right2": {
	"orientation": "horizontal",
	"modules": [
		"mpris",
    "custom/cava",
	]
},
"hyprland/workspaces": {
	"active-only": false,
	"all-outputs": true,
	"format": "{icon}",
	"show-special": false,
	"on-click": "activate",
	"on-scroll-up": "hyprctl dispatch workspace e+1",
	"on-scroll-down": "hyprctl dispatch workspace e-1",
    "persistent-workspaces": {
      "*": 5
	},
	"format-icons": {
		"active": "",
		"default": "",
	},
},
  "custom/cava": {
  "exec": "~/.config/waybar/scripts/cava-smart.sh",
  "format": "{}",
  "tooltip": false
},
}
