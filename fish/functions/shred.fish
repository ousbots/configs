# Alias shred to shred
function shred
	gshred --verbose --iteration 5 --zero $argv; and echo "rm -f $argv"; and rm -f $argv
end

