:- module(fuzzy, [fuzzy_inference/2]).

:- use_module(variables/map).

fuzzy_inference(Answers, FactorsResult) :-
    findall(
        Factor-Position,
        get_factor(Answers, Position, Factor),
        FactorsPairs),
    keysort(FactorsPairs, SortedFactorsPairs),
    reverse(SortedFactorsPairs, FactorsResult).

get_factor([ AnswerPN,  AnswerSE,  AnswerBD, AnswerCSD,  AnswerSEA,  AnswerVSE,  AnswerVCS,  AnswerPS,  AnswerCSH,  AnswerE], Position, Factor) :-
    get_PN_factor(AnswerPN, Position, PNFactor),
    get_SE_factor(AnswerSE, Position, SEFactor),
    get_BD_factor(AnswerBD, Position, BDFactor),
    get_CSD_factor(AnswerCSD, Position, CSDFactor),
    get_SEA_factor(AnswerSEA, Position, SEAFactor),
    get_VSE_factor(AnswerVSE, Position, VSEFactor),
    get_VCS_factor(AnswerVCS, Position, VCSFactor),
    get_PS_factor(AnswerPS, Position, PSFactor),
    get_CSH_factor(AnswerCSH, Position, CSHFactor),
    get_E_factor(AnswerE, Position, EFactor),
    FuzzyFactors = [
        PNFactor,
        SEFactor,
        BDFactor,
        CSDFactor,
        SEAFactor,
        VSEFactor,
        VCSFactor,
        PSFactor,
        CSHFactor,
        EFactor
    ],
    list_sum(FuzzyFactors, SumFuzzyFactors),
    Factor is SumFuzzyFactors / 10,
    true.



get_PN_factor(Answer, Position, Factor) :-
    map_PN_factor(Answer, Position, Factor).

get_SE_factor(Answer, Position, Factor) :-
    map_SE_factor(Answer, Position, Factor).

get_BD_factor(Answer, Position, Factor) :-
    map_BD_factor(Answer, Position, Factor).

get_CSD_factor(Answer, Position, Factor) :-
    map_CSD_factor(Answer, Position, Factor).

get_SEA_factor(Answer, Position, Factor) :-
    map_SEA_factor(Answer, Position, Factor).

get_VSE_factor(Answer, Position, Factor) :-
    map_VSE_factor(Answer, Position, Factor).

get_VCS_factor(Answer, Position, Factor) :-
    map_VCS_factor(Answer, Position, Factor).

get_PS_factor(Answer, Position, Factor) :-
    map_skill_factor(Answer, Factor1),
    skill_factor(Position, Factor2),
    Factor is 1 - abs(Factor1 - Factor2).

get_CSH_factor(Answer, Position, Factor) :-
    map_skill_factor(Answer, Factor1),
    skill2_factor(Position, Factor2),
    Factor is 1 - abs(Factor1 - Factor2).

get_E_factor(Answer, Position, Factor) :-
    map_exp_factor(Answer, Factor1),
    exp_factor(Position, Factor2),
    Factor is 1 - abs(Factor1 - Factor2).



list_sum([], 0).
list_sum([H|T], S) :-
    list_sum(T, Tail),
    S is H + Tail.