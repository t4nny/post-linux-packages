#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else
	#Update and Upgrade
	echo "Updating and Upgrading"
	apt-get update && sudo apt-get upgrade -y

	sudo apt-get install dialog
	cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
	options=(1 "Sublime Text 3" off    
	         2 "Node.js" off
	         3 "VS Code"
			 4 "Git" off
	         5 "JDK 8" off
	         6 "VLC Media Player" off
	         7 "Unity Tewak Tool" off
	         8 "Google Chrome" off
	         9 "Teamiewer" off
	         10 "Skype" off
			 11 "Netspeed Indicator" off
			 12 "Generate SSH Keys" off
			 13 "Ruby" off
			 14 "Chromium" off)
		choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
		clear
		for choice in $choices
		do
		    case $choice in
	        	1)
				echo "Installing Sublime Text..."
				add-apt-repository ppa:webupd8team/sublime-text-3 -y
				apt update
				apt install sublime-text-installer -y
				;;
				
			2)
				echo "Installing Nodejs..."
				sudo apt install nodejs
				sudo apt install npm
				sudo apt-get update
                sudo apt-get upgrade
				;;

			3)
				
				echo "Installing VS Code..."
				sudo apt install software-properties-common apt-transport-https wget
				wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
				sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
				sudo apt update
				sudo apt install code
				;;

			4)
				echo "Installing Git, please congiure git later..."
				apt install git -y
				;;
			
			5)
				echo "Installing JDK 8..."
				apt install python-software-properties -y
				add-apt-repository ppa:webupd8team/java -y
				apt update
				apt install oracle-java8-installer -y
				;;
			
			6)
				echo "Installing VLC Media Player..."
				apt install vlc -y
				;;

			7)
				echo "Installing Unity Tweak Tool..."
				apt install unity-tweak-tool -y
				;;

			8)

				echo "Installing Google Chrome..."
				wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
				sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
				apt-get update 
				apt-get install google-chrome-stable -y
				;;

			
			9)
				echo "Installing Teamviewer..."
				wget http://download.teamviewer.com/download/teamviewer_i386.deb
				dpkg -i teamviewer_i386.deb
				apt-get install -f -y
				rm -rf teamviewer_i386.deb
				;;

			10)
				echo "Installing Skype..."
				wget https://go.skype.com/skypeforlinux-64.deb
				sudo apt install ./skypeforlinux-64.deb
				rm -rf skypeforlinux-64.deb
				;;	
			
			11)
				echo "Installing NetSpeed Indicator"
				apt-add-repository ppa:fixnix/netspeed -y
				apt-get update
				apt install indicator-netspeed-unity -y
				;;
			12)
				echo "Generating SSH keys"
				ssh-keygen -t rsa -b 4096
				;;
			13)
				echo "Installing Ruby"
				apt install ruby-full -y
				;;

			14)

				echo "Installing Chromium...."
				sudo apt install chromium-browser
				;;
				
	    esac
	done
fi
