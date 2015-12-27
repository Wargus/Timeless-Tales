--       _________ __                 __
--      /   _____//  |_____________ _/  |______     ____  __ __  ______
--      \_____  \\   __\_  __ \__  \\   __\__  \   / ___\|  |  \/  ___/
--      /        \|  |  |  | \// __ \|  |  / __ \_/ /_/  >  |  /\___ \
--     /_______  /|__|  |__|  (____  /__| (____  /\___  /|____//____  >
--             \/                  \/          \//_____/            \/
--  ______________________                           ______________________
--                        T H E   W A R   B E G I N S
--         Stratagus - A free fantasy real time strategy game engine
--
--      icons.lua - Define the icons.
--
--      (c) Copyright 2001-2004 by Lutz Sammer and Jimmy Salmon
--
--      This program is free software; you can redistribute it and/or modify
--      it under the terms of the GNU General Public License as published by
--      the Free Software Foundation; either version 2 of the License, or
--      (at your option) any later version.
--
--      This program is distributed in the hope that it will be useful,
--      but WITHOUT ANY WARRANTY; without even the implied warranty of
--      MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--      GNU General Public License for more details.
--
--      You should have received a copy of the GNU General Public License
--      along with this program; if not, write to the Free Software
--      Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
--

function DefineIcon(arg)
	local icon = CIcon:New(arg.Name)
	icon.G = CPlayerColorGraphic:New(arg.File, arg.Size[1], arg.Size[2])
	icon.Frame = 0
end

local icons = {
  {"icon-peon", 1},
  {"icon-grunt", 3},
  {"icon-axethrower", 5},
  {"icon-berserker", 7},
  {"icon-knight", 8},
  {"icon-ogre", 9},
  {"icon-paladin", 10},
  {"icon-ogre-mage", 11},
  {"icon-dwarves", 12},
  {"icon-goblin-sappers", 13},
  {"icon-mage", 14},
  {"icon-death-knight", 15},
  {"icon-ballista", 16},
  {"icon-catapult", 17},
  {"icon-human-oil-tanker", 18},
  {"icon-orc-oil-tanker", 19},
  {"icon-orc-transport", 21},
  {"icon-orc-destroyer", 23},
  {"icon-battleship", 24},
  {"icon-ogre-juggernaught", 25},
  {"icon-gnomish-submarine", 26},
  {"icon-giant-turtle", 27},
  {"icon-gnomish-flying-machine", 28},
  {"icon-zeppelin", 29},
  {"icon-gryphon-rider", 30},
  {"icon-dragon", 31},
  {"icon-wise-man", 32},
  {"icon-ice-bringer", 33},
  {"icon-man-of-light", 34},
  {"icon-sharp-axe", 35},
  {"icon-double-head", 36},
  {"icon-daemon", 37},
  {"icon-orc-shipyard", 49},
  {"icon-human-refinery", 50},
  {"icon-orc-refinery", 51},
  {"icon-human-foundry", 52},
  {"icon-orc-foundry", 53},
  {"icon-human-oil-platform", 54},
  {"icon-orc-oil-platform", 55},
  {"icon-stables", 56},
  {"icon-ogre-mound", 57},
  {"icon-gnomish-inventor", 58},
  {"icon-alchemist", 59},
  {"icon-human-watch-tower", 60},
  {"icon-orc-watch-tower", 61},
  {"icon-church", 62},
  {"icon-altar-of-storms", 63},
  {"icon-mage-tower", 64},
  {"icon-temple-of-the-damned", 65},
  {"icon-keep", 66},
  {"icon-stronghold", 67},
  {"icon-castle-upgrade", 68},
  {"icon-fortress-upgrade", 69},
  {"icon-castle", 70},
  {"icon-fortress", 71},
  {"icon-gryphon-aviary", 72},
  {"icon-dragon-roost", 73},
  {"icon-gold-mine", 74},
  {"icon-human-guard-tower", 75},
  {"icon-human-cannon-tower", 76},
  {"icon-orc-guard-tower", 77},
  {"icon-orc-cannon-tower", 78},
  {"icon-oil-patch", 79},
  {"icon-dark-portal", 80},
  {"icon-circle-of-power", 81},
  {"icon-runestone", 82}, 
  {"icon-move-peon", 84},
  {"icon-build-basic", 87},
  {"icon-build-advanced", 88},
  {"icon-return-goods-peon", 90},
  {"icon-cancel", 91},
  {"icon-human-wall", 92},
  {"icon-orc-wall", 93},
  {"icon-slow", 94},
  {"icon-invisibility", 95},
  {"icon-haste", 96},
  {"icon-runes", 97},
  {"icon-unholy-armor", 98},
  {"icon-lightning", 99},
  {"icon-flame-shield", 100},
  {"icon-fireball", 101},
  {"icon-touch-of-darkness", 102},
  {"icon-death-coil", 103},
  {"icon-whirlwind", 104},
  {"icon-blizzard", 105},
  {"icon-holy-vision", 106},
  {"icon-heal", 107},
  {"icon-death-and-decay", 108},
  {"icon-109", 109},
  {"icon-exorcism", 110},
  {"icon-eye-of-kilrogg", 111},
  {"icon-bloodlust", 112},
  {"icon-unknown113", 113},
  {"icon-skeleton", 114},
  {"icon-raise-dead", 114},
  {"icon-critter", 115},
  {"icon-polymorph", 115},
  {"icon-battle-axe1", 119},
  {"icon-battle-axe2", 120},
  {"icon-battle-axe3", 121},
  {"icon-122", 122},
  {"icon-123", 123},
  {"icon-throwing-axe1", 127},
  {"icon-throwing-axe2", 128},
  {"icon-throwing-axe3", 129},
  {"icon-horse1", 130},
  {"icon-horse2", 131},
  {"icon-longbow", 132},
  {"icon-ranger-scouting", 133},
  {"icon-ranger-marksmanship", 134},
  {"icon-light-axes", 135},
  {"icon-berserker-scouting", 136},
  {"icon-berserker-regeneration", 137},
  {"icon-catapult1", 138},
  {"icon-catapult2", 139},
  {"icon-ballista1", 140},
  {"icon-ballista2", 141},
  {"icon-human-demolish", 142},
  {"icon-orc-demolish", 143},
  {"icon-human-ship-cannon1", 144},
  {"icon-human-ship-cannon2", 145},
  {"icon-human-ship-cannon3", 146},
  {"icon-orc-ship-cannon1", 147},
  {"icon-orc-ship-cannon2", 148},
  {"icon-orc-ship-cannon3", 149},
  {"icon-orc-ship-armor1", 150},
  {"icon-orc-ship-armor2", 151},
  {"icon-orc-ship-armor3", 152},
  {"icon-human-ship-armor1", 153},
  {"icon-human-ship-armor2", 154},
  {"icon-human-ship-armor3", 155},
  {"icon-orc-ship-move", 156},
  {"icon-human-ship-move", 157},
  {"icon-orc-ship-return-oil", 158},
  {"icon-human-ship-return-oil", 159},
  {"icon-orc-ship-haul-oil", 160},
  {"icon-human-ship-haul-oil", 161},
  {"icon-human-unload", 162},
  {"icon-orc-unload", 163},
  {"icon-orc-shield1", 167},
  {"icon-orc-shield2", 168},
  {"icon-orc-shield3", 169},
  {"icon-170", 170},
  {"icon-171", 171},
  {"icon-172", 172},
  {"icon-173", 173},
  {"icon-174", 174},
  {"icon-175", 175},
  {"icon-176", 176},
  {"icon-177", 177},
  {"icon-orc-patrol-land", 179},
  {"icon-orc-stand-ground", 181},
  {"icon-orc-attack-ground", 183},
  {"icon-human-patrol-naval", 184},
  {"icon-orc-patrol-naval", 185},
  {"icon-quick-blade", 186},
  {"icon-female-hero", 187},
  {"icon-ugly-guy", 188},
  {"icon-evil-knight", 189},
  {"icon-beast-cry", 190},
  {"icon-flying-angel", 191},
  {"icon-fire-breeze", 192},
  {"icon-white-mage", 193},
  {"icon-fad-man", 194},
  {"icon-knight-rider", 195},
}

DefineIcon({
	Name = "icon-human-patrol-land",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/patrol_land.png"
})

DefineIcon({
	Name = "icon-human-stand-ground",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/stand_ground.png"
})

DefineIcon({
	Name = "icon-return-goods-peasant",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/return_goods.png"
})

DefineIcon({
	Name = "icon-arrow1",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/arrow.png"
})

DefineIcon({
	Name = "icon-arrow2",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/barbed_arrow.png"
})

DefineIcon({
	Name = "icon-arrow3",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/barbed_arrow_grayed.png"
})

DefineIcon({
	Name = "icon-town-hall",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/town_hall.png"
})

DefineIcon({
	Name = "icon-farm",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/farm.png"
})

DefineIcon({
	Name = "icon-human-barracks",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/barracks.png"
})

DefineIcon({
	Name = "icon-elven-lumber-mill",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/carpenters_shop.png"
})

DefineIcon({
	Name = "icon-human-blacksmith",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/smithy.png"
})

DefineIcon({
	Name = "icon-peasant",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/worker.png"
})

DefineIcon({
	Name = "icon-footman",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/warrior.png"
})

DefineIcon({
	Name = "icon-archer",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/archer.png"
})

DefineIcon({
	Name = "icon-ranger",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/archer_blond_hair.png"
})

DefineIcon({
	Name = "icon-great-hall",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/goblin/icons/town_hall.png"
})

DefineIcon({
	Name = "icon-orc-barracks",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/goblin/icons/mess_hall.png"
})

DefineIcon({
	Name = "icon-pig-farm",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/goblin/icons/farm.png"
})

DefineIcon({
	Name = "icon-troll-lumber-mill",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/goblin/icons/lumber_mill.png"
})

DefineIcon({
	Name = "icon-orc-blacksmith",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/goblin/icons/smithy.png"
})

DefineIcon({
	Name = "icon-human-shield1",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/wooden_oblong_shield.png"
})

DefineIcon({
	Name = "icon-human-shield2",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/bronze_shield.png"
})

DefineIcon({
	Name = "icon-human-shield3",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/bronze_shield_grayed.png"
})

DefineIcon({
	Name = "icon-sword1",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/short_sword_extra_1.png"
})

DefineIcon({
	Name = "icon-sword2",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/broad_sword.png"
})

DefineIcon({
	Name = "icon-sword3",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/germanic/icons/broad_sword_grayed.png"
})

DefineIcon({
	Name = "icon-move-peasant",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/dwarf/icons/boots.png"
})

DefineIcon({
	Name = "icon-repair",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/neutral/icons/repair.png"
})

DefineIcon({
	Name = "icon-harvest",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/neutral/icons/harvest.png"
})

DefineIcon({
	Name = "icon-human-attack-ground",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/neutral/icons/attack_ground.png"
})

DefineIcon({
	Name = "icon-human-shipyard",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/teuton/icons/dock.png"
})

DefineIcon({
	Name = "icon-human-destroyer",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/teuton/icons/kogge.png"
})

DefineIcon({
	Name = "icon-human-transport",
	Size = {46, 38},
	File = Wyrmsun .. "graphics/dwarf/icons/transport.png"
})

if (wargus.tileset == nil) then
  for i = 1,table.getn(icons) do
    icon = CIcon:New(icons[i][1])
  end
else
  for i = 1,table.getn(icons) do
    icon = CIcon:New(icons[i][1])
    icon.G = CPlayerColorGraphic:New("tilesets/" .. wargus.tileset .. "/icons.png", 46, 38)
    icon.Frame = icons[i][2]
  end
end

