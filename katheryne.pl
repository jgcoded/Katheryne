/** <module> Katheryne
Genshin Impact Expert System

https://github.com/jgcoded/Katheryne

@author Julio Gutierrez
@license MIT

Sample queries:

?- team(superconduct, melt, A, B, C, D).
A = albedo,
B = beidou,
C = chongyun,
D = amber

team(overloaded, vaporize, A, B, C, D),
burst(A, aoe),
burst(B, heal),
not(element(C, geo)).


team(overloaded, vaporize, A, B, C, D),
weapon(A, claymore),
weapon(B, bow),
weapon(C, sword),
weapon(D, polearm),
resonance(A, B).


team(overloaded, vaporize, A, B, C, D),
burst(A, aoe),
burst(B, heal),
not(A=albedo),
not(B=albedo),
not(C=albedo),
not(D=albedo).

*/

/* DATABASE

element(A, X) <- character A is element X
weapon(A, X) <- character A uses weapon X
burst(A, X) <- character A's burst does X
reaction(X, Y, Z) <- Elements X and Y make reaction Z
resonance(A, B) <- character A has elemental resonce with character B
team(X, Y, A, B, C, D) <- Make a team with four characters that can do X and Y reactions
*/

% Characters and their elements
element(albedo, geo).
element(amber, pyro).
element(barbara, hydro).
element(beidou, electro).
element(bennett, pyro).
element(chongyun, cryo).
element(diluc, pyro).
element(diona, cryo).
element(fischl, electro).
element(ganyu, cryo).
element(hutao, pyro).
element(jean, anemo).
element(kaeya, cryo).
element(keqing, electro).
element(klee, pyro).
element(lisa, electro).
element(mona, hydro).
element(ningguang, geo).
element(noelle, geo).
element(qiqi, cryo).
element(razor, electro).
element(sucrose, anemo).
element(tartaglia, hydro).
element(mc-anemo, anemo).
element(mc-geo, geo).
element(venti, anemo).
element(xiangling, pyro).
element(xiao, anemo).
element(xingqiu, hydro).
element(xinyan, hydro).
element(zhongli, geo).

% characters and their weapons
% Characters and their elements
weapon(albedo, sword).
weapon(amber, bow).
weapon(barbara, catalyst).
weapon(beidou, claymore).
weapon(bennett, sword).
weapon(chongyun, claymore).
weapon(diluc, claymore).
weapon(diona, bow).
weapon(fischl, bow).
weapon(ganyu, bow).
weapon(hutao, polearm).
weapon(jean, sword).
weapon(kaeya, sword).
weapon(keqing, sword).
weapon(klee, catalyst).
weapon(lisa, catalyst).
weapon(mona, catalyst).
weapon(ningguang, catalyst).
weapon(noelle, claymore).
weapon(qiqi, sword).
weapon(razor, claymore).
weapon(sucrose, catalyst).
weapon(tartaglia, bow).
weapon(mc-anemo, sword).
weapon(mc-geo, sword).
weapon(venti, bow).
weapon(xiangling, polearm).
weapon(xiao, polearm).
weapon(xingqiu, sword).
weapon(xinyan, claymore).
weapon(zhongli, polearm).

% bursts
burst(razor, aoe).
burst(barbara, heal).

% Reactions
reaction(electro, pyro, overloaded).
reaction(electro, cryo, superconduct).
reaction(electro, hydro, electrocharged).
reaction(cryo, hydro, frozen).
reaction(cryo, pyro, melt).
reaction(hydro, pyro, vaporize).
reaction(dendro, pyro, burning).
reaction(geo, _, crystalize).
reaction(anemo, _, swirl).

% Create a team that can make elemental reactions X and Y
team(X, Y, A, B, C, D) :-
    element(A, E),
    element(B, F),
    element(C, G),
    element(D, H),
    not(A = B),
    not(A = C),
    not(A = D),
    not(B = C),
    not(B = D),
    not(C = D),
    ((reaction(E, F, X);
    reaction(E, G, X);
    reaction(E, H, X);
    reaction(F, G, X);
    reaction(F, H, X);
    reaction(G, H, X)),
    (reaction(E, F, Y);
    reaction(E, G, Y);
    reaction(E, H, Y);
    reaction(F, G, Y);
    reaction(F, H, Y);
    reaction(G, H, Y))).

% Give two characters A, B that can make reaction X
two(X, A, B) :-
    element(A, E),
    element(B, F),
    reaction(E, F, X).

% Elemental resonance occurs when
% two characters have the same element
resonance(A, B) :-
    element(A, Z),
    element(B, Z).

% or when four characters have four different elements
resonance(X, Y, Z, W) :-
    element(X, A),
    element(Y, B),
    element(Z, C),
    element(W, D),
    not(A = B),
    not(A = C),
    not(A = D),
    not(B = C),
    not(B = D),
    not(C = D).

% The debuff that an element applies to enemies
debuff(electro, engulfing_storm, energy_recharge).
debuff(hydro, slowing_water, skill_cooldown).
debuff(pyro, smoldering_flames, damage).
debuff(cryo, condensed_ice, stamina).

