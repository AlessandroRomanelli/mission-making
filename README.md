# Introduction
Hello, I'm Roman. I'm here today to teach you about how to make a perfectly working mission for our unit.

First of all, let's start by the objectives of this **README**, at the end of this short page you should know:
* How to use the files contained in this repository;
* How to modify your mission in order for everything to work nicely;
* How to assemble and compile your mission.

# ArmA3 Mission Building
If you don't have an extensive knowledge about ArmA3 mission building, do read this part, it's kind of important to understand how everything comes together in the final end product.

## The Boneback of a Mission

First things first, let's explain what a mission is: a mission is a folder which contains a **.sqm** file. That's it, really. It also contains additional others file but that we won't consider them just yet.

### The Folder

You might think that the name of this folder is up to you, but it's not entirely true: the folder must have the scenario name, a dot and the map class name in order to work properly.

```
yourMissionName.mapClassname
```
For example:
```
Defence_Of_Hong_Kong.fow_map_henderson <--- OK
Defence_Of_Hong_Kong 			  	   <--- NOT OK, missing map, will fail upon loading.
Defence_Of_Hong_Kong.FoW_map_henderson <--- NOT OK, wrong map name (case sensitive).
```
*Don't panic*, the editor usually creates a folder with the correct formatting, but in case you alter the folder name, keep this in mind.

 Another important concept is that you can't have a mission without a **.sqm**, but what is it really?

### The .SQM

An **.sqm** file is simply a relatively long and boring list of objects you decide to place down in a given scenario (or map): it's a direct product of the in-game editor **3DEN**. Each object you had to a map is added to this list and some properties are described, like: position, orientation, health, cargo, relationships with other objects and so on.

Generally speaking, you want to keep the hell away from this file: it's generated from the game and should be touched only through the game, that means modifying it only by using the editor.

### Not simply a static business
It is worth noting that **.sqm** not only stores information about objects, markers, units as static elements, but it also provides the user with the ability of defining scripts that can be executed during the mission.
This is usually done in two different ways:
* Using the **init** of an object;
* Using triggers.

Okay, but what are those? The theory is simple, putting it in practice slightly less.

### The *init* field

The **init** of any given object, is code that will run **once upon loading the mission**. It is **not necessarily** bound to the object, but most of the time is: *If you want to run some script on a given object, you place a code in its init*. However, it is possible to run a script on a object that affects something else entirely!

If you are a beginner you will mostly likely use this as it is one of the simplest ways to add scripts to a mission file.

### The Triggers

Triggers are special objects within ArmA, they get **triggered** and they **fire**. But they get triggered by what? And what is that they fire precisely?

Perhaps we want code that should not be running as the mission starts, but rather we want this code to run **when a given condition is encountered** and perhaps we don't want it to just happen anywhere, but we want that condition to be met **only within a specific area**.

This is done by using triggers, they are **active listeners**: they can be positioned, they have a scalable size and take a condition which is continuously evaluated to see if it is either **true** or **false**:
* when it goes from *false to true*, the trigger **activates**;
* when it goes from *true* to *false*, the user **deactivates**;
* when it stays the same, **nothing happens**.

By placing code in the **onAct** and **onDeact** fields, we can run script whenever our conditions are met, or not met anymore, *how cool is that*?

Learning how to efficiently program with these, will be for another time, I'm afraid.

## What is built around the .sqm
If we could do all we wanted in the **.sqm**, that would be great, but - sad news - we live in an imperfect world.

This means that sometimes, **init fields and triggers simply won't be enough**. Or they might get the job done but in inefficient ways. For instance, we could set up a trigger to evaluate whether the player is alive, and when it deactivates, it means the player has just died, whereas if it activates, it means the player re-spawned!

Now, a better way to do this would be to run code that is automatically executed by the game whenever the player is killed and some other code when the player re-spawns. But how to do this?

Luckily enough, we can expand our initial mission consisting of a simple **.sqm** file, with new files.

Here below the most important ones:
* **description.ext**
* *init.sqf*
*  *initPlayerLocal.sqf*
*  *initServer.sqf*
*  *onPlayerKilled.sqf*
*  *onPlayerRespawn.sqf*

Now, why did I put emphasis on the first item? **description.ext** is what binds everything together. "**.ext**" probably stands for *extension* and it is what this file actually does. It's probably the single most important file in your mission, because it's needed to **extend** the .sqm file and set up the background of your mission.

## description.ext

You can find an extensive explanation of options and settings [HERE](https://community.bistudio.com/wiki/Description.ext), I won't judge you if you don't want to read it now, though. It is enough to know that within here, all the mission parameters are contained, such as:
* *What kind of respawn should be used?*
* *What kind of mission is it? (COOP, PvP, ...)*
* *What channels should be disabled?*
* *Should AI takes playable units' slots?*

But there's more! I mean, of course there is, there always is.

The **description.ext** file allows us to modify some Configs. Oh, you don't know what configs are yet? Don't worry, it's not a big deal. Just know that they are lists of contents, which can be weapons (*cfgWeapons*), vehicles (*cfgVehicles*) and so on, used by the game to define its assets.
For instance:
> **cfgWeapons** is a long list of weapons, where each weapon is a list of parameters. Each parameter serves a purpose and what the config does is binding every aspect of a weapon: its 3D model, its texture, animations, sounds, magazines and so much more so that the end the game can load all the aspects of the weapon and use them together.

This has major implications: it means that we can add custom music by placing it in the mission folder and defining it in the **description.ext** by modifying **cfgMusic**, as well as custom sound effects!

Or even better, we can define some of our code as functions with **cfgFunctions**, which means that we can call our code whenever we want during the game and throughout our code, without having to rewrite it all out.

It would be pretty harsh if we had a huge mission with tons of scripts all being linked directly in this file, that is why we use **#include**, which can link external config files (within our mission folder) to our existing description.ext, without encumbering it.

## Different formats - Different roles
You might have noticed by now that we have multiple file formats within our mission folder: *.sqm, .sqf, .ext, .hpp, h*, while we know what *.sqm* and *.ext* do by now, you might be confused to see *.sqf, .hpp* and *.h*

Fear not:
* **.sqf** files are plain ArmA3 code, some might be long and impossible to understand, some might be very simple, but always **code** remains;
* **.hpp** and **.h** files are **config files**, they contain classes that define, as we said before, lists of various kinds to be used by the game.

## The other predefined .sqfs
After the *description.ext* we are left with 5 others **.sqf** files, which, as I said above, contain raw code. It should be noted at this point that the game might create some of them by default, but the user can create them out of thin air just creating a new file and using the **exact names and extensions**.

### But first, about locality...
I'm sure most of those who are reading have no idea what **locality** is, but in a nutshell, it means that there are more than one machine running the game in multiplayer environment and not all are equals.

This has some very serious implications. Because what happens on a machine sometimes might not be happening on others: this is the reason behind many behaviors you encountered, where you were seeing/experiencing stuff while the other users weren't.

There are generally three types of code:
* **globally** executed, run on every machine connected to the server, server included.;
* **server** executed, server machine will run the code and no one else;
* **locally** executed, only the machine on which the code is executed will run the code.

To make it even more fun, consider that the effects of code may also vary in locality. Crazy, huh? However it's unimportant right now.

Let's clear up what these five different files do:
* **init.sqf**: it does the same thing as a normal init field, but it is not bound to an object. It is run once, globally at the very start of the mission. Bohemia states that this file is run for each client who connects upon loading the mission. (*It used to be the only file used prior to ArmA3*);
* **initPlayerLocal.sqf**: if you got the concept of locality right, you might understand that if you want to run code that is not supposed to run on the server machine, then you should put it in here. This feature was introduced in ArmA3 and it has proved to be more reliable than the standard **init.sqf**.
* **initServer.sqf**: again, this follows the locality principles, if we want to run code on the server but it's not necessary that it runs client-wise;
* **onPlayerKilled.sqf**: is code that runs whenever the player is killed;
* **onPlayerRespawn.sqf**: code that is run when the player respawns.


----------


You shouldn't need to know anything else in order to follow me in the setup.

# Overall Folder Description
```
> roman
> taw_vd
description.ext
init.sqf
initPlayerLocal.sqf
initServer.sqf
onPlayerKilled.sqf
onPlayerRespawn.sqf
```

In the **roman** folder you can find all my works.
All my functions are defined in the *cfgFunctions.hpp* and each *fn_funcName.sqf* file is a defined function.

## Maintenance and Changes

In the **loadouts** folder several *.sqf* are present, one for each predefined gear, you can change any *.sqf* to best suit your needs. You can get a very similar file by exporting your loadout from the in-game Arsenal, just by pressing Ctrl+C when in the arsenal and then Ctrl+V in a text editor. Remember to **replace 'this'** with **'player'**.

```
player setVariable ["Saved_Loadout", getUnitLoadout player];
```

Which saves the player's gear in case he dies and needs his gear back upon respawning.

The file *whitelist.h* contains a config (or a list) of **UIDs** that are inside specific classes, nothing should be changed but only this part:
```
members[] = { ... }
```

Remember to add a comment next to the **UID** to remember whose it is.

## Creating the mission
When creating your mission you should be careful because our codes rely on some variablesNames that need to be present:
* UNITS:
	* **HQ**, the unit that the leader will control;
	* **zeus1**, **zeus2**, they are the two Mission Makers.
* MARKERS:
	* **respawn_guerrila**, it's where players will respawn if HQ spawn is unavailable. (Be careful about the spelling);
	* **airfield**, it's where the pilots will respawn;
	* **air_spawn**, it's where spawned planes will fly in from.

Along with these variableNames, you should also place down important assets, such as:
* Virtual Arsenal, it can be anything you want and must have this in the init: ``[this, false] spawn rmn_fnc_arsenalRestriction;``
* Donators Virtual Arsenal, any item you want. Init: ``[this, true] spawn rmn_fnc_arsenalRestriction;``
* Loadouts Box. Init: ``[this] spawn rmn_fnc_loadouts;``
* Radio Air-Spawn: should be a radio next to the pilots' spawn, init: ``[this] spawn rmn_fnc_makeAirSpawn;``

## How to assemble the mission
You should be cloning this repository so that you have a working copy on your computer at all times and keep it in sync when working on your missions.

When you have finished working on your mission and have a **.sqm** ready, simply copy paste all the contents from your local working copy of this repository to your mission folder.

Compile your folder into a **.pbo**, play it.
