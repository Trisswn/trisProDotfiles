{
        "layer": "top",
        "position": "top",
        "reload_style_on_change": true,
        "modules-left": ["custom/notification", "bluetooth", "network", "clock"],
        "modules-center": ["hyprland/workspaces#kanji"],
        "modules-right": [ "mpris", "custom/separador", "battery"],


        "hyprland/workspaces": {
            "format": "{icon}",
            "format-icons": {
                "active": "",
                "default": "",
                "empty": ""
            },
            "persistent-workspaces": {
                "*": [ 1,2,3,4,5 ]
            }
        },
        "custom/notification": {
            "tooltip": false,
            "format": "",
            "on-click": "swaync-client -t -sw",
            "escape": true
        },
        "clock": {
            "format": "{:%I:%M %p} ",
            "interval": 60,   
            "tooltip-format": "<tt>{calendar}</tt>",
            "calendar": {
                "format": {
                    "today": "<span color='#fAfBfC'><b>{}</b></span>"
                }
            },
            "actions": {
                "on-click-right": "shift_down",
                "on-click": "shift_up"
            }
        },
        "network": {
            "format-wifi": "",
            "format-ethernet":"",
            "format-disconnected": "",
            "tooltip-format-disconnected": "Error",
            "tooltip-format-wifi": "{essid} ({signalStrength}%) ",
            "tooltip-format-ethernet": "{ifname} 🖧 ",
            "on-click": "kitty nmtui"
        },
        "bluetooth": {
            "format-on": "󰂯",
            "format-off": "BT-off",
            "format-disabled": "󰂲",
            "format-connected-battery": "{device_battery_percentage}% 󰂯",
            "format-alt": "{device_alias} 󰂯",
            "tooltip-format": "{controller_alias}\t{controller_address}\n\n{num_connections} connected",
            "tooltip-format-connected": "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}",
            "tooltip-format-enumerate-connected": "{device_alias}\n{device_address}",
            "tooltip-format-enumerate-connected-battery": "{device_alias}\n{device_address}\n{device_battery_percentage}%",
            "on-click-right": "blueman-manager",
        }, 
        "battery": {
            "interval":30,
            "states": {
                "good": 95,
                "warning": 30,
                "critical": 20
            },
            "format": "{capacity}% {icon}",
            "format-charging": "{capacity}% 󰂄",
            "format-plugged": "{capacity}% 󰂄 ",
            "format-alt": "{time} {icon}",
            "format-icons": [
                "󰁻",
            "󰁼",
            "󰁾",
            "󰂀",
            "󰂂",
            "󰁹"
            ],
        },
       "custom/expand": {
            "format": "",
            "tooltip": false
        },
        "custom/endpoint":{
            "format": "|",
            "tooltip": false
        },
        "group/expand": {
            "orientation": "horizontal",
            "drawer": {
                "transition-duration": 600,
                "transition-to-left": true,
                "click-to-reveal": true
            },
            "modules": ["custom/expand", "custom/colorpicker","cpu","memory","temperature","custom/endpoint"],
        },
        "custom/colorpicker": {
            "format": "{}",
            "return-type": "json",
            "interval": "once",
            "exec": "~/.config/waybar/scripts/colorpicker.sh -j",
            "on-click": "~/.config/waybar/scripts/colorpicker.sh",
            "signal": 1
        },
        "cpu": {
            "format": "󰻠",
            "tooltip": true
        },
        "memory": {
            "format": ""
        },
        "temperature": {
            "critical-threshold": 80,
            "format": "",
        },
        "tray": {
            "icon-size": 14,
            "spacing": 10
        },
        
"mpris": {
	"interval": 1,
	"format": "{player_icon} <i>{dynamic}</i>",
	"format-paused": "{status_icon} <i>{artist} {title}</i>",
	"on-click-middle": "playerctl play-pause",
	"on-click": "playerctl previous",
	"on-click-right": "playerctl next",
	"scroll-step": 5.0,
	"on-scroll-up": "$HOME/.config/hypr/scripts/volume.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/volume.sh --dec",
	"smooth-scrolling-threshold": 1,
	"tooltip": true,
	"tooltip-format": "{status_icon} {dynamic}\nLeft Click: previous\nMid Click: Pause\nRight Click: Next",
	"player-icons": {
		"chromium": "",
		"default": "",
		"firefox": "",
		"kdeconnect": "",
		"mopidy": "",
		"mpv": "󰐹",
		"spotify": "",
		"vlc": "󰕼",
	},
	"status-icons": {
		"paused": "󰐎",
		"playing": "",
		"stopped": "",
	},
	"dynamic-order": ["artist", "title"],
	"ignored-players": ["firefox", "zen"],
	"max-length": 50,
	
	    "on-click": "playerctl play-pause",
	    "on-click-right": "playerctl next",
	    "on-click-middle": "playerctl previous",
	    "tooltip": true,
	    "tooltip-format": "{player} ({status})\n{artist} - {title}"
},
  "custom/separador": {
      "format": " |",
	    "interval": "once",
	    "tooltip": false
  },
  "custom/separador2": {
      "format": "  ",
	    "interval": "once",
	    "tooltip": false
  },
    "custom/cava": {
    "exec": "~/.config/waybar/cava.sh",
    "format": "{}",
    "return-type": "text",
    "interval": 1,
    "tooltip": false
    },
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
"wireplumber": {
	"format": "{icon} {volume} %",
	"format-muted": " Mute",
	"on-click": "$HOME/.config/hypr/scripts/volume.sh --toggle",
	"on-click-right": "pavucontrol -t 3",
	"on-scroll-up": "$HOME/.config/hypr/scripts/volume.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/volume.sh --dec",
	"format-icons": [
		"", "", "󰕾", ""
	],
},



 
} 

