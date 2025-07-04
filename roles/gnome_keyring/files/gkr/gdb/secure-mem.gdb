

break egg_secure_alloc
commands
  silent
  printf "➕ egg_secure_alloc\n"
  continue
end

break egg_secure_realloc
commands
  silent
  printf "➕ reallocating password buffer\n"
  continue
end

break egg_secure_free
commands
  silent
  printf "🧹 freeing secure memory\n"
  continue
end
