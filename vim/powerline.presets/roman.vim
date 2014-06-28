fun! promptline#presets#clear#get()
  return {
        \'a'    : [ promptline#slices#cwd() ],
        \'c'    : [ promptline#slices#vcs_branch() ],
        \'b'    : [ promptline#slices#git_status() ],
        \'warn' : [ promptline#slices#last_exit_code() ]}
endfun
