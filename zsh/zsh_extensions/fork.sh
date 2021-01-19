f()
{
	$@ &> /dev/null & disown
}
compdef f=exec

fe()
{
	$@ &> /dev/null & disown && exit
}
compdef fe=exec

