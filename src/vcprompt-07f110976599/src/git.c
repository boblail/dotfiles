#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <unistd.h>
#include <sys/param.h>
#include "git.h"

static int
git_probe(vccontext_t* context)
{
    return isdir(".git");
}

int
git_get_submodule_branch(vccontext_t* context)
{
    FILE *fp;
    char buf[1024];

    if ((fp = fopen(".gitmodules", "r")) == NULL) {
        debug("unable to read .gitmodules; assuming no submodules");
        return 0;
    }
    else {
        while (fgets(buf, 1024, fp) != NULL) {
            char *submodule_rel_path;
            char *prefix = "path = ";

            chop_newline(buf);
            if ((submodule_rel_path = strstr(buf, prefix)) != NULL) {
                char submodule_full_path[MAXPATHLEN];

                getwd(submodule_full_path); /* the root git directory */
                sprintf(submodule_full_path, "%s/\%s",
                    submodule_full_path, submodule_rel_path+strlen(prefix));
                debug("submodule path '%s'; cwd '%s'",
                    submodule_full_path, context->cwd);

                if (strstr(context->cwd, submodule_full_path) != NULL) {
                    debug("submodule path found '%s'", submodule_full_path);
                    return 1;
                }
            }
        }
    }
    debug("not in a submodule");
    return 0;
}

static result_t*
git_get_info(vccontext_t* context)
{
    result_t* result = init_result();
    char buf[1024];

    if (!read_first_line(".git/HEAD", buf, 1024)) {
        debug("unable to read .git/HEAD: assuming not a git repo");
        return NULL;
    }
    else {
        char* prefix = "ref: refs/heads/";
        int prefixlen = strlen(prefix);

        if (strncmp(prefix, buf, prefixlen) == 0) {
            /* yep, we're on a known branch */
            char *branch = buf+prefixlen;
            debug("read a head ref from .git/HEAD: '%s', branch '%s'",
                buf, branch);
            strcpy(result->branch, branch);
            result->submodule = git_get_submodule_branch(context);
        }
        else {
            debug(".git/HEAD doesn't look like a head ref: unknown branch");
            strcpy(result->branch, "(unknown)");
        }
    }

    return result;
}

vccontext_t* get_git_context(options_t* options)
{
    vccontext_t *context = init_context("git", options, git_probe, git_get_info);
    getwd(context->cwd);
    debug("current working directory: %s", context->cwd);
    return context;
}
