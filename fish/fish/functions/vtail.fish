function vtail
	set -q argv; or set argv "."
find $argv[1] -type f -exec ls -t {} + | xargs -d '\n' vlc -Lf --no-random
end
