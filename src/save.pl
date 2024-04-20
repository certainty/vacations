:- [load_paths].

:- use_module(library(plunit)).
:- set_test_options([run(manual), load(always)]).

:- use_module(cli_path(main)).
:- use_module(library(qsave)).


main :- qsave_program("bin/vacations", [
                      undefined(error),
                      toplevel(cli_toplevel),
                      autoload(false),
                      stand_alone(true)
                  ]).
