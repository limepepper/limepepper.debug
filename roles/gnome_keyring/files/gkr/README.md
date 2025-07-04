# README

login.keyring is a dummy keyring generated for testing. password in "fedora"

```
[gnome_keyring] $ ./files/gkr/dump-keyring0-format ./files/gkr/login.keyring
Password: 
#version: 0.0 / crypto: 0 / hash: 0
[keyring]
display-name=Login
ctime=0
mtime=1750818303
lock-on-idle=false
lock-after=false
lock-timeout=0
x-hash-iterations=1483
x-salt=txdcgTfNi2g=
x-num-items=6
x-crypto-size=1008

[10]
item-type=2
display-name=test-dump-password
secret=hello-world
ctime=1751479865
mtime=1751479865

[9]
item-type=2
display-name=ergregre
secret=123123
ctime=1750986497
mtime=1750986497

[7]
item-type=0
display-name=Chromium Safe Storage
secret=lkEwd5Uuq4o8NiGEq0CkTQ==
ctime=1750820001
mtime=1750820001

[8]
item-type=0
display-name=test-pass
secret=fedora
ctime=1750915816
mtime=1750988612

[1]
item-type=2
display-name=test pass
secret=password
ctime=1750819675
mtime=1750819675

[6]
item-type=0
display-name=Chrome Safe Storage Control
secret=The meaning of life
ctime=1750820001
mtime=1750820001

[10:attribute0]
name=xdg:schema
type=0
value=org.gnome.keyring.Note

[9:attribute0]
name=xdg:schema
type=0
value=org.gnome.keyring.Note

[7:attribute0]
name=application
type=0
value=chromium

[7:attribute1]
name=xdg:schema
type=0
value=chrome_libsecret_os_crypt_password_v2

[8:attribute0]
name=test-key
type=0
value=regreg

[1:attribute0]
name=xdg:schema
type=0
value=org.gnome.keyring.Note

[6:attribute0]
name=explanation
type=0
value=Because of quirks in the gnome libsecret API, Chrome needs to store a dummy entry to guarantee that this keyring was properly unlocked. More details at http://crbug.com/660005.

[6:attribute1]
name=xdg:schema
type=0
value=_chrome_dummy_schema_for_unlocking

```
