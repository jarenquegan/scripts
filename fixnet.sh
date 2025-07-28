#!/usr/bin/expect -f

# Set timeout for commands
set timeout 1

# Open Telnet connection
spawn telnet 192.168.8.2

# Wait for login prompt and enter login
expect "Login:"
send "gepon\r"

# Wait for password prompt and enter password
expect "Password:"
send "gepon\r"

# Wait for the next prompt and enter 'enable'
expect "User>"
send "enable\r"

# Wait for the enable password prompt and enter it
expect "Password:"
send "gepon\r"

# Wait for Config prompt and navigate to switch
expect "Config#"
send "cd switch\r"

# Disable port forwarding eligibility
expect "Config\\switch# "
send "control port_fw_eligiblity disable\r"

# Wait for success message
expect "Cmd success!"

# End the session
send "exit\r"

expect eof
