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
--      buttons.lua - Define the general unit-buttons.
--
--      (c) Copyright 2012 by Kyran Jackson
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

UnitTypeFiles["unit-axethrower"] = {summer = "orc/units/troll_axethrower_green.png",
  winter = "orc/units/troll_axethrower_green.png",
  wasteland = "orc/units/troll_axethrower_yellow.png",
  swamp = "orc/units/troll_axethrower_green.png"}

DefineUnitType("unit-axethrower", { Name = "Feral Axethrower",
  Image = {"file", "size", "size", {72, 72}},
  Animations = "animations-axethrower", Icon = "icon-axethrower",
  Costs = {"time", 70, "gold", 500, "wood", 50},
  Speed = 10,
  HitPoints = 40,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {36, 36},
  SightRange = 5, ComputerReactionRange = 7, PersonReactionRange = 5,
  BasicDamage = 3, PiercingDamage = 6, Missile = "missile-axe",
  MaxAttackRange = 4,
  Priority = 55,
  Points = 60,
  Demand = 1,
  Corpse = "unit-orc-dead-body",
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "axethrower-selected",
    "acknowledge", "axethrower-acknowledge",
    "ready", "axethrower-ready",
    "help", "basic orc voices help 1",
    "dead", "basic orc voices dead"} } )

UnitTypeFiles["unit-grunt"] = {summer = "orc/units/grunt_green.png",
  winter = "orc/units/grunt_green.png",
  wasteland = "orc/units/grunt_green.png",
  swamp = "orc/units/grunt_green.png"}

DefineUnitType("unit-grunt", { Name = "Wild Knight",
  Image = {"file", "size", "size", {72, 72}},
  Animations = "animations-grunt", Icon = "icon-grunt",
  Costs = {"time", 60, "gold", 600},
  Speed = 10,
  HitPoints = 60,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 4, ComputerReactionRange = 6, PersonReactionRange = 4,
  Armor = 2, BasicDamage = 6, PiercingDamage = 3, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 60,
  Points = 50,
  Demand = 1,
  Corpse = "unit-orc-dead-body",
  Type = "land",
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true,
  LandUnit = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "grunt-selected",
    "acknowledge", "grunt-acknowledge",
    "ready", "grunt-ready",
    "help", "basic orc voices help 1",
    "dead", "basic orc voices dead"} } )

DefineUnitType("unit-peon", { Name = "Fawn",
  Image = {"file", "orc/units/peon.png", "size", {72, 72}},
  Animations = "animations-peon", Icon = "icon-peon",
  Costs = {"time", 45, "gold", 400},
  Speed = 10,
  HitPoints = 30,
  DrawLevel = 40,
  TileSize = {1, 1}, BoxSize = {31, 31},
  SightRange = 4, ComputerReactionRange = 6, PersonReactionRange = 4,
  AutoRepairRange = 4,
  BasicDamage = 3, PiercingDamage = 2, Missile = "missile-none",
  MaxAttackRange = 1,
  Priority = 50,
  Points = 30,
  Demand = 1,
  Corpse = "unit-orc-dead-body",
  Type = "land",
  RightMouseAction = "harvest",
  CanAttack = true, RepairRange = 1,
  CanTargetLand = true,
  LandUnit = true,
  Coward = true,
  CanGatherResources = {
   {"file-when-loaded", "orc/units/peon_with_gold.png",
    "resource-id", "gold",
    "resource-capacity", 100,
    "wait-at-resource", 150,
    "wait-at-depot", 150},
   {"file-when-loaded", "orc/units/peon_with_wood.png",
    "resource-id", "wood",
    "resource-capacity", 100,
    "resource-step", 2,
    "wait-at-resource", 24,
    "wait-at-depot", 150,
    "terrain-harvester"}},
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "peon-selected",
    "acknowledge", "peon-acknowledge",
    "ready", "peon-ready",
    "help", "basic orc voices help 1",
    "dead", "basic orc voices dead"} } )

DefineUnitType("unit-fire-breeze", { Name = "Evil Dragon",
  Image = {"file", "orc/units/dragon.png", "size", {88, 80}},
  Animations = "animations-fire-breeze", Icon = "icon-fire-breeze",
  Costs = {"time", 250, "gold", 2500},
  Speed = 14,
  HitPoints = 800,
  DrawLevel = 60,
  TileSize = {2, 2}, BoxSize = {71, 71},
  SightRange = 9, ComputerReactionRange = 8, PersonReactionRange = 6,
  Armor = 10, BasicDamage = 10, PiercingDamage = 25, Missile = "missile-dragon-breath",
  MaxAttackRange = 5,
  Priority = 65,
  Points = 150,
  Demand = 1,
  Type = "fly", ShadowFly = {Value = 0, Enable = true},
  RightMouseAction = "attack",
  CanAttack = true,
  CanTargetLand = true, CanTargetSea = true, CanTargetAir = true,
  AirUnit = true,
  DetectCloak = true,
  organic = true,
  SelectableByRectangle = true,
  Sounds = {
    "selected", "deathwing-selected",
    "acknowledge", "deathwing-acknowledge",
--    "ready", "deathwing-ready",
    "help", "basic orc voices help 1",
    "dead", "explosion"} } )
	
local icons = {
  {"icon-orc-patrol-land", 178},
}

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