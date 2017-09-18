is_interactive || return  
PS1="\[\e[33m\]\t\[\e[0m\] | \[\e[36m\]\u\[\e[0m\]\[\e[30m\]@\[\e[0m\]\[\e[35m\]\h\[\e[0m\] | \[\e[32m\]\w\[\e[0m\]\`if [ \$? -ne 0 ]; then echo \" |\" \[\e[31m\]:\(\[\e[0m\]; fi\`\n\[\e[34m\]\\$\[\e[0m\] "
