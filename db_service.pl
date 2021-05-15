:- module(db_service, [update_position/2, add_new_position/2, delete_position/1]).
:- use_module(db).


update_position(Position, Attributes) :-
    delete_position(Position),
    add_new_position(Position, Attributes),
	commit.


add_new_position(Position, [English, Nationality, Engineer, CsAbsolvent, SoftwareEngKnowledge, 
    VisualStudioKnowledge, VersionControlKnowledge, ProgrammingSkill, CshKnowledge, Experience]) :-
    assertz(db:programmingSkill(Position,ProgrammingSkill)),
    assertz(db:cshKnowledge(Position, CshKnowledge)),
    assertz(db:experience(Position, Experience)),
    (
        English == yes -> assertz(db:english(Position));
        true
    ),
    (
        Nationality == yes -> assertz(db:polishNationality(Position));
        true
    ),
    (
        CsAbsolvent == yes -> assertz(db:csAbsolvent(Position));
        true
    ),
	(
        Engineer == yes -> assertz(db:engineer(Position));
        true
    ),
    (
        SoftwareEngKnowledge == yes -> assertz(db:softwareEngKnowledge(Position));
        true
    ),
    (
        VisualStudioKnowledge == yes -> assertz(db:visualStudioKnowledge(Position));
        true
    ),
    (
        VersionControlKnowledge == yes -> assertz(db:versionControlKnowledge(Position));
        true
    )
	,commit
    .

delete_position(Position) :-
	retractall(db:english(Position)),
	retractall(db:polishNationality(Position)),
	retractall(db:engineer(Position)),
	retractall(db:csAbsolvent(Position)),
	retractall(db:softwareEngKnowledge(Position)),
	retractall(db:visualStudioKnowledge(Position)),
	retractall(db:versionControlKnowledge(Position)),
	retractall(db:programmingSkill(Position, _)),
	retractall(db:cshKnowledge(Position, _)),
	retractall(db:experience(Position,_)),
	commit.


commit :- 
    tell('db_records.pl'),
    listing(db:english),
    listing(db:polishNationality),
    listing(db:engineer),
    listing(db:csAbsolvent),
    listing(db:softwareEngKnowledge),
    listing(db:visualStudioKnowledge),
    listing(db:versionControlKnowledge),
    listing(db:programmingSkill),
    listing(db:cshKnowledge),
    listing(db:experience),
    told.

