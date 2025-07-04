


# break setsid
# commands
#     print "📍 breaking in setsid"
# inferior
#     continue
# end


break fork_and_print_environment
  commands
  print "📍 breaking in fork_and_print_environment"
  continue
end

break read_login_password
commands
  silent
  printf "📍 entered read_login_password()\n"
  continue
end
