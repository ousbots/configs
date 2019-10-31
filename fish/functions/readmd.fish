# Alias readmd to pandoc | lynx -stdin
function readmd
	pandoc $argv | lynx -vikeys -stdin
end

