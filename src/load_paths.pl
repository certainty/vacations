:- set_prolog_flag(encoding, utf8).

:- dynamic user:file_search_path/2.
:- multifile user:file_search_path/2.

:- use_module(library(filesex)).

% Setup load paths

top_level_directory(Path) :-
    prolog_load_context(file, File),
    relative_file_name(Path, File, '..').

add_bin_path :-
    top_level_directory(TopDir),
    directory_file_path(TopDir, 'bin', BinDir),
    asserta(user:file_search_path(bin_path, BinDir)).

:- add_bin_path.


add_data_path :-
    top_level_directory(TopDir),
    directory_file_path(TopDir, 'data', DataDir),
    asserta(user:file_search_path(data_path, DataDir)).

:- add_data_path.

add_src_path :-
    top_level_directory(TopDir),
    directory_file_path(TopDir, 'src', SrcDir),
    asserta(user:file_search_path(src_path, SrcDir)).

:- add_src_path.

add_cli_path :-
    user:file_search_path(src_path, Dir),
    directory_file_path(Dir, 'cli', Path),
    asserta(user:file_search_path(cli_path, Path)).

:- add_cli_path.
