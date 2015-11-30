# show a list of commands for sql azure including a short synopsis 
get-command *azuresqldatabase* | get-Help | format-table Name, Synopsis -Wrap
