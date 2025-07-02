
# logic flow



```mermaid
flowchart TD

    gkm_wrap_prompt_done_credential --> fix_login_keyring_if_unlock_failed --> gkm_wrap_login_steal_failed_password 
    gkm_wrap_login_steal_failed_password --> retrieve["get unlock failed"]
    fix_login_keyring_if_unlock_failed --> good["egg_secure_strfree (good)"]
    retrieve["get unlock failed"] --> bad["fixed_login_keyring_password (bad)"]
    

```

```c
gchar*
gkm_wrap_login_steal_failed_password (void)
{
	gpointer oldval;

	oldval = g_atomic_pointer_get (&unlock_failure);
	if (!g_atomic_pointer_compare_and_exchange (&unlock_failure, oldval, NULL))
		oldval = NULL;

	return oldval;
}
```

```c
/* Holds failed unlock password, accessed atomically */
static gpointer unlock_failure = NULL;
```

this is the only one that updates `unlock_failure` to new value:

```c
void
gkm_wrap_layer_mark_login_unlock_failure (const gchar *failed_password)
{
	gpointer oldval;
	gpointer newval;

	g_return_if_fail (failed_password);

	oldval = g_atomic_pointer_get (&unlock_failure);
	newval = egg_secure_strdup (failed_password);

	if (g_atomic_pointer_compare_and_exchange (&unlock_failure, oldval, newval))
		egg_secure_strfree (oldval);
	else
		egg_secure_strfree (newval);
}
```

```mermaid
flowchart TD

    gkd-main.c:main --> |will unlock if login| gkd_control_listen 
    gkd_control_listen --> control_accept
    control_accept --> control_input
    control_input --> control_process
    control_process -->|GKD_CONTROL_OP_UNLOCK| control_unlock_login
    control_process -->|GKD_CONTROL_OP_CHANGE| control_change_login
    pam --> unlock_keyring
    unlock_keyring --> control_unlock_login
    control_process -->|GKD_CONTROL_OP_INITIALIZE| control_initialize_components
    control_initialize_components --> gkd_main_complete_initialization
    gkd_main_complete_initialization --> gkr_daemon_initialize_steps
    gkr_daemon_initialize_steps -->|if login_password| gkd_login_unlock
    control_unlock_login --> gkd_login_unlock
    gkd_login_unlock --> unlock_or_create_login 
    unlock_or_create_login["unlock_or_create_login"] --> lookup_login_session["lookup_login_session ()"] --> lookup_login_keyring["lookup_login_keyring ()"] --> create_credential["create_credential ()"] --> cred
    cred -->|"if (cred == NULL) AND CKR_PIN_INCORRECT "| gkm_wrap_layer_mark_login_unlock_failure
    cred --> create_login_keyring
    cred --> gkm_wrap_layer_mark_login_unlock_success
    
    gkm_wrap_layer_mark_login_unlock_success --> unset[/unset unlock_failure/]
    
    gkm_wrap_layer_mark_login_unlock_failure --> set[/set unlock_failure to failed pass/]
    

```

```c
unlock_or_create_login (GList *modules, const gchar *master){
...
	if (cred == NULL) {
		if (login && g_error_matches (error, GCK_ERROR, CKR_PIN_INCORRECT))
			gkm_wrap_layer_mark_login_unlock_failure (master);
```

