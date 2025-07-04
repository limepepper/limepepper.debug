
catch syscall exit_group
commands
  silent
  printf "🛑 Caught syscall/signal exit!\n"
  backtrace
  info registers
  continue
end

catch syscall exit
commands
  silent
  printf "🛑 Caught syscall/signal exit!\n"
  backtrace
  info registers
  continue
end

catch signal SIGSEGV
commands
  silent
  printf "🛑 Caught syscall/signal exit!\n"
  backtrace
  info registers
  continue
end

catch signal SIGABRT
commands
  silent
  printf "🛑 Caught syscall/signal exit!\n"
  backtrace
  info registers
  continue
end

catch syscall exit_group
commands
  silent
  printf "🛑 Program called exit_group()\n"
  backtrace
  continue
end

catch signal SIGABRT
commands
  silent
  printf "🚨 Caught SIGABRT\n"
  backtrace
  continue
end

# catch signal SIGCHLD
# commands
#   print "Parent process completing normally"
#   continue
# end

# catch fork
# commands
# # print (int)getpid()
# print "Caught fork in catch"
# continue
# end
