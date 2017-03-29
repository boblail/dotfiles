#ifndef VCPROMPT_H
#define VCPROMPT_H

#include <sys/param.h>

typedef struct {
    int debug;
    char* format;                       /* e.g. "[%b%u%m]" */
    int show_branch;                    /* show current branch? */
    int show_revision;                  /* show current revision? */
    int show_unknown;                   /* show ? if unknown files? */
    int show_modified;                  /* show ! if local changes? */
    int show_submodule;                 /* show (sub) if in submodule? */
} options_t;

typedef struct {
    char branch[MAXPATHLEN];            /* name of current branch */
    char revision[MAXPATHLEN];          /* current revision */
    int unknown;                        /* any unknown files? */
    int modified;                       /* any local changes? */
    int submodule;                      /* current directory is a submodule? */
} result_t;

typedef struct vccontext_t vccontext_t;
struct vccontext_t {
    const char *name;                   /* name of the VC system */
    options_t* options;

    char cwd[MAXPATHLEN];

    /* context methods */
    int (*probe)(vccontext_t*);
    result_t* (*get_info)(vccontext_t*);
};

void set_options(options_t*);
vccontext_t* init_context(const char *name,
                          options_t* options,
                          int (*probe)(vccontext_t*),
                          result_t* (*get_info)(vccontext_t*));
void free_context(vccontext_t* context);

result_t* init_result();
void free_result(result_t*);

void debug(char*, ...);

int isdir(char*);
int file_exists(char*);
int read_first_line(char*, char*, int);
void chop_newline(char*);

#endif
