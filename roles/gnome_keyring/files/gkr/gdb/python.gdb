
# python
# import gdb
# from rich import inspect
# import subprocess

# def new_inferior(event):
#     print("New inferior detected!")
#     inf = event.inferior
#     print("Child PID:", event.inferior.pid)
#     print("Child PID:", event.inferior.num)

#     # subprocess.Popen([
#     #    'gdb', '-batch', '-p', str(event.inferior.pid),
#     #    '-ex', 'continue',
#     #    '-ex', 'detach'
#     # ])

#     # gdb.execute(f"inferior {event.inferior.num}")
#     # gdb.execute("detach")
# gdb.events.new_inferior.connect(new_inferior)
# end

set print inferior-events on
set detach-on-fork off
set schedule-multiple on
set follow-fork-mode child
set non-stop off

python
def switch_inferior_and_continue(x):
    print("switching inferior and continuing")
    gdb.execute("inferior %d" % x)
    gdb.execute("continue")

def exit_handler(event):
    print("in the exit handler")
    has_threads = [ inferior.num for inferior in gdb.inferiors() if inferior.threads() ]
    if has_threads:
        print("have threads")
        has_threads.sort()
        gdb.post_event(lambda: switch_inferior_and_continue(has_threads[0]))

gdb.events.exited.connect(exit_handler)
end

source /opt/gkr-debug/watchpoints.gdb
source /opt/gkr-debug/breakpoints.gdb
source /opt/gkr-debug/catchpoints.gdb

# python
# gdb.execute("set python print-stack full")

# def switch_inferior_and_continue(x):
#     print("switching inferior and continuing")
#     gdb.execute("inferior %d" % x)
#     gdb.execute("continue")

# def exit_handler(event):
#     print("in the exit handler")
#     has_threads = [ inferior.num for inferior in gdb.inferiors() if inferior.threads() ]
#     if has_threads:
#         has_threads.sort()
#         gdb.post_event(lambda: switch_inferior_and_continue(has_threads[0]))
#     else:
#         print("doesn't have threads")

# gdb.events.exited.connect(exit_handler)


# def do_continue():
#     print("in do continue")
#     gdb.execute("continue")


# def stop_handler(event):
#     global my_stop_request
#     print("in the stop handler")
#     if isinstance(event, gdb.SignalEvent):
#         pass
#     elif isinstance(event, gdb.BreakpointEvent):
#         pass
#     elif my_stop_request:
#         print("in my stop request")
#         my_stop_request = False
#         gdb.post_event(do_continue)

# gdb.events.stop.connect(stop_handler)

# end

info inferiors
