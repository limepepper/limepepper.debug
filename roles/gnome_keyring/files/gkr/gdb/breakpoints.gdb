
#                  _
#  _ __ ___   __ _(_)_ __
# | '_ ` _ \ / _` | | '_ \
# | | | | | | (_| | | | | |
# |_| |_| |_|\__,_|_|_| |_|
#


break gkd-main.c:main
commands
    silent
    print "breaking in main"
    print argc
    print argv[0]
    print argv[1]
    print argv[2]
    print argv[3]
    watch login_password
    commands
        printf "👀 login_password set\n"
        print login_password
        continue
    end
    watch run_foreground
    commands
        silent
        printf "👀 run_foreground set\n"
        continue
    end
    inferior
    continue
end

#        _       _       _             _
#   __ _| | ____| |     | | ___   __ _(_)_ __
#  / _` | |/ / _` |_____| |/ _ \ / _` | | '_ \
# | (_| |   < (_| |_____| | (_) | (_| | | | | |
#  \__, |_|\_\__,_|     |_|\___/ \__, |_|_| |_|
#  |___/                         |___/




break unlock_or_create_login
commands
    silent
    print "📍 breaking in unlock_or_create_login"
#    backtrace
    continue
end

break module_instances
commands
    silent
    print "📍 breaking in module_instances"
#    backtrace
    continue
end

break gkd_login_unlock
commands
    silent
    print "📍 breaking in gkd_login_unlock"
    backtrace
    continue
end

break open_and_login_session
commands
    silent
    print "📍 breaking in open_and_login_session"
    continue
end

break lookup_login_session
commands
    silent
    print "📍 breaking in lookup_login_session"
    continue
end

break gkd_login_unlock
commands
    silent
    print "📍 breaking in gkd_login_unlock"
    backtrace
    continue
end



break create_login_keyring
commands
    silent
    print "📍 breaking in create_login_keyring"
#    backtrace
    continue
end

#                                 _             _
# __      ___ __ __ _ _ __       | | ___   __ _(_)_ __
# \ \ /\ / / '__/ _` | '_ \ _____| |/ _ \ / _` | | '_ \
#  \ V  V /| | | (_| | |_) |_____| | (_) | (_| | | | | |
#   \_/\_/ |_|  \__,_| .__/      |_|\___/ \__, |_|_| |_|
#                    |_|                  |___/


break gkm_wrap_prompt_done_credential
commands
    silent
    print "📍 breaking in gkm_wrap_prompt_done_credential"
    printf "📍 call_result = %d\n", call_result
#    watch call_result
#    commands
#        print "👀 call_result set"
#        print call_result
#        continue
#    end
    continue
end

break gkm_wrap_login_steal_failed_password
commands
    silent
    print "📍 breaking in gkm_wrap_login_steal_failed_password"
#    backtrace
    continue
end

break setup_unlock_prompt
commands
    silent
    print "📍 breaking in setup_unlock_prompt"
#    backtrace
    continue
end

#                  _             _
#   ___ ___  _ __ | |_ _ __ ___ | |      ___  ___ _ ____   _____ _ __
#  / __/ _ \| '_ \| __| '__/ _ \| |_____/ __|/ _ \ '__\ \ / / _ \ '__|
# | (_| (_) | | | | |_| | | (_) | |_____\__ \  __/ |   \ V /  __/ |
#  \___\___/|_| |_|\__|_|  \___/|_|     |___/\___|_|    \_/ \___|_|
#


break control_process
commands
    silent
    print "📍 breaking in control_process"
#    backtrace
    continue
end

break login_prompt_do_specific
commands
    silent
    print "📍 breaking in login_prompt_do_specific"
#    backtrace
    continue
end

break gkm_wrap_prompt_request_password
commands
    silent
    print "📍 breaking in gkm_wrap_prompt_request_password"
    backtrace
    continue
end

break auto_unlock_lookup_object
commands
    silent
    print "📍 breaking in auto_unlock_lookup_object"
#    backtrace
    continue
end

break gkm_wrap_prompt_do_credential
commands
    silent
    print "📍 breaking in gkm_wrap_prompt_do_credential"
#    backtrace
    continue
end

break gkm_wrap_login_did_unlock_fail
commands
    silent
    print "📍 breaking in gkm_wrap_login_did_unlock_fail"
#    backtrace
    continue
end

break setup_unlock_keyring_login
commands
    silent
    print "📍 breaking in setup_unlock_keyring_login"
#    backtrace
    continue
end

break fix_login_keyring_if_unlock_failed
commands
    silent
    print "📍 breaking in fix_login_keyring_if_unlock_failed"
#    watch failed
#    commands
#        print "👀 failed set"
#        print failed
#        continue
#    end
#    backtrace
    continue
end

break gkm_wrap_layer_mark_login_unlock_failure
commands
    silent
    print "📍 breaking in gkm_wrap_layer_mark_login_unlock_failure"
#    backtrace
    continue
end

break gkm_wrap_layer_mark_login_unlock_success
commands
    silent
    print "📍 breaking in gkm_wrap_layer_mark_login_unlock_success"
#    backtrace
    continue
end


break gkd_util_init_master_directory
commands
  silent
  print "📍 breaking in gkd_util_init_master_directory"
  continue
end

break gkr_daemon_initialize_steps
commands
  silent
  print "📍 breaking in gkr_daemon_initialize_steps"
  continue
end
