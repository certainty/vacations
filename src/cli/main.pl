:- module(cli, [cli_toplevel/0, run/1]).

cli_toplevel :-
    current_prolog_flag(argv, Argv),
    run(Argv),
    halt(0).

run(_) :-  format('Hello World').
