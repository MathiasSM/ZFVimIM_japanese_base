let s:repoPath=expand('<sfile>:p:h:h')
function! s:dbInit()
    let repoPath = s:repoPath
    let dbFile = '/misc/japanese.txt'
    let dbCountFile = '/misc/japanese_count.txt'

    let db = ZFVimIM_dbInit({
                \   'name' : 'jp',
                \ })
    call ZFVimIM_cloudRegister({
                \   'mode' : 'git',
                \   'dbId' : db['dbId'],
                \   'repoPath' : repoPath,
                \   'dbFile' : dbFile,
                \   'dbCountFile' : dbCountFile,
                \   'gitUserEmail' : get(g:, 'ZFVimIM_japanese_gitUserEmail', get(g:, 'zf_git_user_email', '')),
                \   'gitUserName' : get(g:, 'ZFVimIM_japanese_gitUserName', get(g:, 'zf_git_user_name', '')),
                \   'gitUserToken' : get(g:, 'ZFVimIM_japanese_gitUserToken', get(g:, 'zf_git_user_token', '')),
                \ })
endfunction

if exists('*ZFVimIME_initFlag') && ZFVimIME_initFlag()
    call s:dbInit()
else
    autocmd User ZFVimIM_event_OnDbInit call s:dbInit()
endif

