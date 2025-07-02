import subprocess

import gdb
from rich import inspect

def new_inferior(event):
    print("New inferior detected!")
    inf = event.inferior
    print("Child PID:", event.inferior.pid)
    print("Child PID:", event.inferior.num)
    gdb.execute(f"inferior {event.inferior.num}")
    gdb.execute("detach")
       subprocess.Popen([
       'gdb', '-batch', '-p', str(child_pid),
       '-ex', 'continue',
       '-ex', 'detach'
   ])



gdb.events.new_inferior.connect(new_inferior)
