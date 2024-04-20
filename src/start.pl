:- [load_paths].

:- use_module(library(main)).
:- initialization(main).

:- use_module(library(plunit)).
:- set_test_options([run(manual)]).

initialise_hup :-
    (   current_prolog_flag(unix, true)
    ->  on_signal(hup, _, hup)
    ;   true).

:- initialise_hup.


:- use_module(cli_path(main)).
:- use_module(library(debug)).

hup(_Signal) :-
  thread_send_message(main, stop).

main(_Argv) :- cli_toplevel.
