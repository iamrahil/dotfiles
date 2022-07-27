function diffkern
echo "Running  :" (uname -r)
echo "Installed: " (pacman -Qi linux | grep Version | cut -d: -f2)
end
