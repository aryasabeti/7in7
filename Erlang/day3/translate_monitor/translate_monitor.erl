%% ---
%%  Excerpted from "Seven Languages in Seven Weeks",
%%  published by The Pragmatic Bookshelf.
%%  Copyrights apply to this code. It may not be used to create training material, 
%%  courses, books, articles, and the like. Contact us if you are in doubt.
%%  We make no guarantees that this code is fit for any purpose. 
%%  Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
%% ---

%% Monitor the translate service and restart it should it die.

-module(translate_monitor).
-export([loop/0]).
loop() ->
    process_flag(trap_exit, true),
    receive
        % {monitor, Process} ->
        %     link(Process),
        %     io:format("Monitoring process.~n"),
        %     loop();

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