function diffkern
echo "Running  :" (uname -r)
echo "Installed:" (pacman -Qi linux | grep Version | awk '{print $3}')
end
