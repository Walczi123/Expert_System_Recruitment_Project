:- module(constants, [
    polishNationality_options/1,
    speakingEnglish_options/1,
    bachelorDegree_options/1,
    computerScienceDegree_options/1,
    seAblities_options/1,
    vsEnv_options/1,
    vcSystem_options/1,
    programmingSkills_options/1,
    cshKnowledge_options/1
    ]).

% yes/no section
polishNationality_options([yes, no]).
speakingEnglish_options([yes, no]).
bachelorDegree_options([yes, no]).
computerScienceDegree_options([yes, no]).
seAblities_options([yes, no]).
vsEnv_options([yes, no]).
vcSystem_options([yes, no]).

% comples options
programmingSkills_options([beginner(b), elementary(e), intermediate(int), upper-intermediate(upint), advanced(adv)]).
cshKnowledge_options([beginner(b), elementary(e), intermediate(int), upper-intermediate(upint), advanced(adv)]).
