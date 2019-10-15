# Alias readmd to pandoc | lynx -stdin
function readmd
	pandoc $argv | lynx -stdin
end

