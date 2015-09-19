%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%% ---

%% 1. Monitor the translate service and restart it should it die.
%% 2. Make the monitor process restart itself if it should die.
%% 3. Make a monitor for the translate_monitor. If either monitor dies, restart it.

-module(translate_monitor).
-export([loop/0]).
-export([init/0]).
-export([init/1]).


init() ->
    process_flag(trap_exit, true),
    Self = self(),
    io:format("Setting up monitor pair. Self Pid: ~p~n", [Self]),
    spawn_monitor(fun() -> translate_monitor:init(Self) end),
    loop().

init(PidToMonitor) ->
    process_flag(trap_exit, true),
    io:format("Second monitor, monitoring ~p~n", [PidToMonitor]),
    erlang:monitor(process, PidToMonitor),
    loop().

loop() ->
    process_flag(trap_exit, true),
    receive
        new -> 
            io:format("Creating + monitoring translate_service.~n"),
            register(translator, spawn_link(fun translate_service:loop/0)),
            loop();

        {'EXIT', From, Reason} ->
            io:format("Translator at ~p died with reason ~p.", [From, Reason]),
            io:format("Creating another.~n"),
            self() ! new,
            loop()
    end.
