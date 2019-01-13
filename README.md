## Description

![Simple Taunt Menu](https://i.imgur.com/qyVvqUn.png)

[Simple Taunt Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=1620980553) is an easy way to add and organize taunts for ANY gamemode. It also ships with the default taunts that are normally included with the [Prop Hunt](https://steamcommunity.com/sharedfiles/filedetails/?id=135509255) gamemode, but no need to install.

Just press and hold your `+menu_context` button (which is the "C" key by default) to bring up the taunt menu and click a taunt to begin taunting.

**Note**: Players must be alive and not a spectator in order to taunt.

Inspired by [Icedream](https://steamcommunity.com/id/icedream2k9)'s [Minimal PropHunt Taunt Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=431297319). If you have a Prop Hunt server, definitely consider using his addon.

## Installation

This addon runs both server-side and client-side. Follow both sections below so that both server and client will have the necessary files.

### Installing Server-side

1. [Subscribe to this addon](https://steamcommunity.com/sharedfiles/filedetails/?id=1620980553).
2. Locate the Simple Taunt Menu gma file in your steam install directory, under `steamapps\common\GarrysMod\garrysmod\addons`.
3. Extract the gma file using something like [Gmad - Easy Addon Extractor](https://gamebanana.com/tools/5868) by [Freenex](https://gamebanana.com/members/1430762).
4. Move the extracted folder into your servers `garrysmod\addons` folder.

### Forcing clients to download this addon

1. Locate your servers `garrysmod\lua\autorun\server\workshop.lua` file.
    - If it doesn't exist, create one.
2. Add the following to the bottom of the file:
    - `resource.AddWorkshop("1620980553") -- Simple Taunt Menu`

## Adding Taunt Packs

By default, Simple Taunt Menu comes with the taunts that are normally included with Prop Hunt. If you'd like to add additional taunt packs, follow the sections below.

### Forcing clients to download the taunt pack

1. Locate the taunt pack from the [Steam Workshop](https://steamcommunity.com/workshop/browse/?appid=4000) that you wish to add.
2. Determine the taunt packs ID, by looking at the page URL.
   * For example, if the taunt pack you want to download is at `https://steamcommunity.com/sharedfiles/filedetails/?id=426548393` then the ID would be **426548393**.
3. Locate your servers `garrysmod\lua\autorun\server\workshop.lua` file.
4. Add the following to the bottom of the file, replacing `{TAUNT_PACK_ID}` with the ID you found in the above step:
    - `resource.AddWorkshop("{TAUNT_PACK_ID}")`

### Determining the paths of taunt pack's sound files
In order to add sounds to Simple Taunt Menu, we'll need to determine where sounds are located in the taunt pack. The best way to do this is to download the taunt pack, and extract it's contents.

1. Locate the taunt pack from the [Steam Workshop](https://steamcommunity.com/workshop/browse/?appid=4000) that you wish to add.
2. Subscribe to the taunt pack.
3. Locate the taunt pack gma file in your steam install directory, under `steamapps\common\GarrysMod\garrysmod\addons`.
3. Extract the gma file using something like [Gmad - Easy Addon Extractor](https://gamebanana.com/tools/5868) by [Freenex](https://gamebanana.com/members/1430762).
4. Look in the extracted folder, in the `sound` directory, finding the paths to the sound files.

### Adding the taunts to the menu

1. After determining the sound paths for each sound file you'd like to add, open Simple Taunt Menu's `sv_stm_taunts.lua` on the server under `garrysmod\addons\{Simple Taunt Menu Folder}\lua\autorun\server`. This file stores a table of categories, sound paths, and taunt names that Simple Taunt Menu uses.
2. Follow the existing table structure to add the taunts from the taunt pack.
   * Sound paths should be relative to the `sound` folder of the taunt pack.
   * Categories can have subcategories, and those subcategories can have more subcategories, and so on.
   * See the [default taunt table](https://pastebin.com/4YA2jJxJ) or [a more complicated example](https://pastebin.com/mEhv6KzZ) using [DN PropHunt Taunt Pack](https://steamcommunity.com/sharedfiles/filedetails/?id=426548393).

## References

* [Minimal PropHunt Taunt Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=431297319) by [Icedream](https://steamcommunity.com/id/icedream2k9)
* [Gmad - Easy Addon Extractor](https://gamebanana.com/tools/5868) by [Freenex](https://gamebanana.com/members/1430762)
