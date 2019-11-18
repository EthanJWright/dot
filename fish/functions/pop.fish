# Defined in /home/god/.config/fish/config.fish @ line 19
function pop
	sed -i '' -e '$ d' $1
end
