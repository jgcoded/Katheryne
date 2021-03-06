# Katheryne
A Genshin Impact Expert System
*...Error...Rebooting...*

**This project is a work in progress.**

Genshin Impact is a great game! I enjoy imagining new team compositions, seeing the elemental reactions, and trying to synergize various characters together.

I wanted a tool that could help me explore all the possible teams given some constraints. So I made this toy Prolog project to do just that!


## What can Katheryne do?

You can ask Katheryne to help you make a team composition like this:

Katheryne, tell me a team that can make superconduct and melt reactions!
```prolog
?- team(superconduct, melt, A, B, C, D).
A = albedo,
B = beidou,
C = chongyun,
D = amber
```

Katheryne, I don't like albedo!

```prolog
?- team(_, _, A, B, C, D),
not(A=albedo),
not(B=albedo),
not(C=albedo),
not(D=albedo).
A = amber,
B = barbara,
C = beidou,
D = bennett
```

Katheryne, give me an overloaded and vaporize team where
the first character's burst has an AOE effect, and the second character's burst can heal, and I don't want the third character's element to be geo!

```prolog
?- team(overloaded, vaporize, A, B, C, D),
burst(A, aoe),
burst(B, heal),
not(element(C, geo)).
A = razor,
B = barbara,
C = amber,
D = albedo
```

Katheryne, tell me a team that can do overloaded and vaporize reactions where the first character uses a claymore, the second character uses a bow, the third character uses a sword, the fourth character uses a polearm, and the first and second characters have resonance. 
```prolog
?- team(overloaded, vaporize, A, B, C, D),
weapon(A, claymore),
weapon(B, bow),
weapon(C, sword),
weapon(D, polearm),
resonance(A, B).
A = beidou,
B = fischl,
C = xingqiu,
D = hutao
```

## Quick Setup

1. Just [click here](https://swish.swi-prolog.org/p/katheryne.pl)!
2. Copy-paste one of the above queries, or write your own!
3. Click Run!
