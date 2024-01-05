# ------------------------------------------------------
# Install tty login and issue
# ------------------------------------------------------
echo -e "${GREEN}"
figlet "Cleanup"
echo -e "${NONE}"

# Check for ttf-ms-fonts
if [[ $(_isInstalledPacman "ttf-ms-fonts") == 0 ]]; then
    echo "The script has detected ttf-ms-fonts. This can cause conflicts with icons in Waybar."
    if gum confirm "Do you want to uninstall ttf-ms-fonts?" ;then
        sudo pacman --noconfirm -R ttf-ms-fonts
    fi
fi

# Check for running NetworkManager.service
# if [[ $(systemctl list-units --all -t service --full --no-legend "NetworkManager.service" | sed 's/^\s*//g' | cut -f1 -d' ') == "NetworkManager.service" ]];then
#     echo "NetworkManager.service already running."
# else
#     sudo systemctl enable NetworkManager.service
#     sudo systemctl start NetworkManager.service
#     echo "NetworkManager.service activated successfully."    
# fi

# Create default folder structure
xdg-user-dirs-update
echo "Default folders created..."
echo 

echo "Cleanup done."