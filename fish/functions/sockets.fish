function sockets
	ls ~/.ssh/socket/ | awk -F'[:@]' 'BEGIN{ print "USER", "HOSTNAME", "PORT", "SSH"} {print $1, $2, $3, $1"@"$2}' | column -t
end
