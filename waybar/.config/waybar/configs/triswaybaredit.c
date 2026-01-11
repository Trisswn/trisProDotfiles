{
        "layer": "top",
        "position": "top",
        "reload_style_on_change": true,
        "modules-left": ["custom/notification", "bluetooth", "network", "group/expand", "hyprland/workspaces#kanji"],
        "modules-center": ["clock"],
        "modules-right": [ "custom/cava", "mpris", "battery", "custom/power"],


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
            "format": "{:%I:%M %p}",
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
            "interval":5,
            "states": {
                "good": 95,
                "warning": 30,
                "critical": 20
            },
            "format": "{icon} {capacity}%",
            "format-charging": " {capacity}%",
            "format-plugged": " {capacity}%",
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
            "format": "",
            "tooltip": false
        },
        "custom/endpoint":{
            "format": " | ",
            "tooltip": false
        },
        "group/expand": {
            "orientation": "horizontal",
            "drawer": {
                "transition-duration": 600,
                "transition-to-left": true,
                "click-to-reveal": true
            },
            "modules": ["custom/expand", "idle_inhibitor","custom/menu","custom/endpoint"],
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
          	"format": "{usage}% 󰍛",
        	  "interval": 1,
        	  "min-length": 5,
        	  "format-alt-click": "click",
	          "format-alt": "{icon0}{icon1}{icon2}{icon3} {usage:>2}% 󰍛",
        	  "format-icons": [
        		"▁", "▂", "▃", "▄", "▅", "▆", "▇", "█"
	          ],
	          "on-click-right": "gnome-system-monitor",
        },
        "memory": {
            "format": ""
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
	"max-length": 43,
	
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

  "cava": {
        // "cava_config": "$XDG_CONFIG_HOME/cava/cava.conf",
        "framerate": 30,
        "autosens": 0,
        "sensitivity": 15,
        "bars": 10,
        "lower_cutoff_freq": 120,
        "higher_cutoff_freq": 6000,
        "hide_on_silence": false,
        //"format_silent": "quiet",
        "method": "pipewire",
        "source": "auto",
        "stereo": true,
        "reverse": false,
        "bar_delimiter": 0,
        "monstercat": false,
        "waves": false,
        "noise_reduction": 0.77,
        "input_delay": 2,
        "format-icons": ["▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" ],
        "actions": {
                   "on-click-right": "mode"
                   }
    },

   "custom/power": {
	  "format": "⏻",
	  "on-click": "$HOME/.config/hypr/scripts/Wlogout.sh",
	  "on-click-right": "$HOME/.config/hypr/scripts/ChangeBlur.sh",
	  "tooltip": true,
	  "tooltip-format":"Logout Menu",
},




"custom/cava": {
  "exec": "~/.config/waybar/scripts/cava-smart.sh",
  "format": "{}",
  "tooltip": false
},

"idle_inhibitor": {
	"tooltip": true,
	"tooltip-format-activated": "Idle_inhibitor active",
	"tooltip-format-deactivated": "Idle_inhibitor not active",
	"format": "{icon}",
	"format-icons": {
		"activated": "",
		"deactivated": "",
	}
},
  "temperature": {
	"interval": 10,
	"tooltip": true,
	"hwmon-path": [
		"/sys/class/hwmon/hwmon1/temp1_input",
		"/sys/class/thermal/thermal_zone0/temp"
	],
	//"thermal-zone": 0,
	"critical-threshold": 82,
	"format-critical": "{icon} {temperatureC}°C",
	"format": "{icon} {temperatureC}°C",
	"format-icons": [
		"󰈸"
	],
	"on-click-right": "$HOME/.config/hypr/scripts/WaybarScripts.sh --nvtop"
},
"backlight": {
	"interval": 2,
	"align": 0,
	"rotate": 0,
	//"format": "{icon} {percent}%",
	"format-icons": [
		" ",
		" ",
		" ",
		"󰃝 ",
		"󰃞 ",
		"󰃟 ",
		"󰃠 "
	],
	"format": "{icon}",
	//"format-icons": ["","","","","","","","","","","","","","",""],
	"tooltip-format": "backlight {percent}%",
	"icon-size": 10,
	"on-click": "",
	"on-click-middle": "",
	"on-click-right": "",
	"on-update": "",
	"on-scroll-up": "$HOME/.config/hypr/scripts/Brightness.sh --inc",
	"on-scroll-down": "$HOME/.config/hypr/scripts/Brightness.sh --dec",
	"smooth-scrolling-threshold": 1,
},
  "wlr/taskbar": {
	"format": "{icon} {name}",
	"icon-size": 13,
	"all-outputs": false,
	"tooltip-format": "{title}",
	"on-click": "activate",
	"on-click-middle": "close",
	"ignore-list": [
		"wofi",
		"rofi",
		"kitty",
    "kitty-dropterm"
		],
},
"custom/menu": {
	"format": "",
	"on-click": "pkill rofi || rofi -show drun -modi run,drun,filebrowser,window",
	"on-click-middle": "$HOME/.config/hypr/scripts/WaybarLayout.sh",
	"on-click-right": "$HOME/.config/hypr/scripts/wppicker.sh",
	"tooltip": true,
	"tooltip-format": "Left Click: Rofi Menu\nMiddle Click: Wallpaper Menu\nRight Click: Waybar Layout Menu",
},

 
}


