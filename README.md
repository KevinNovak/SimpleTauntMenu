## Description

![Simple Taunt Menu](https://i.imgur.com/qyVvqUn.png)

[Simple Taunt Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=1620980553) is an easy way to add and organize taunts for ANY game mode. It also ships with the default taunts that are normally included with the [Prop Hunt](https://steamcommunity.com/sharedfiles/filedetails/?id=135509255) gamemode, but no need to install.

Just press and hold your `+menu_context` button (which is the "C" key by default) to bring up the taunt menu and click a taunt to begin taunting.

**Note**: Players must be alive and not a spectator in order to taunt.

Inspired by [Icedream](https://steamcommunity.com/id/icedream2k9)'s [Minimal PropHunt Taunt Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=431297319). If you have a Prop Hunt server, definitely consider using his addon.

## Installation

This addon runs both server-side and client-side. Follow both sections below so that both server and client will have the necessary files.

### Installing Server-side

1. [Subscribe to this addon](https://steamcommunity.com/sharedfiles/filedetails/?id=1620980553).
2. Locate the Simple Taunt Menu gma file in your steam install directory, under `steamapps\common\GarrysMod\garrysmod\addons`.
3. Move the gma file into your servers `garrysmod\addons` folder.

### Forcing clients to download this addon

1. Locate your servers `garrysmod\lua\autorun\server\workshop.lua` file.
    - If one doesn't exist, create one.
2. Add the following to the bottom of the file:
    - `resource.AddWorkshop("1620980553") -- Simple Taunt Menu`

## References

[Minimal PropHunt Taunt Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=431297319) by [Icedream](https://steamcommunity.com/id/icedream2k9)
