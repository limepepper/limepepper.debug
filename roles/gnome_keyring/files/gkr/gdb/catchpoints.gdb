
catch syscall setsid
commands
  silent
  printf "setsid() called, PPID will become 1\n"
  continue
end

catch signal SIGSTOP
commands
  silent
  # printf "🛑 Caught syscall/signal SIGSTOP!\n"
  continue
end

catch fork
commands
  silent
  print "caught fork"
 # shell logger "Caught fork in gkr-debug.gdb"
    continue
end
