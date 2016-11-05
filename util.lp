member(X,[X|T]).
member(X,[Y|T]) :- X\=Y, member(X,T).

inter([], _, []).
inter([H1|T1], L2, [H1|Res]) :- member(H1, L2), inter(T1, L2, Res).
inter([_|T1], L2, Res) :- inter(T1, L2, Res).

times(List) :- t([H1,H2|T]), timesloop(H1, H2, T, List).
timesloop(L, _, [], L).
timesloop(P1, P2, [H|T], List) :- inter(P1, P2, L3), timesloop(L3, H, T, List).

% t([[[1477998000, 1478005200], [150, 200]], [[1477994400, 1478001600], [1477998000, 1478005200], [150, 200]]]).

% #include 'main.lp'.

% ?- times(Times).
