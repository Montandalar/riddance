# Riddance: Rid yourself of stuff you don't want

Don't like fire? Want to hide TNT from the creative menu? Maybe get rid of that
annoying biome from your favourite game or a useless chat command? You can do
all of these things with Riddance.

Riddance can rid you of:
* Items - which means nodes, craftitems, and tools
* Biomes
* Chat commands

Riddance can also hit items from the creative inventory.

## Who and what is riddance for?

Riddance is for people that want to remove certain small things from their
world without needing to code and without needing to modify the mods that add
those undesired things.

Riddance is not a proper solution for more complicated tasks like preventing
people from using stuff without removing it entirely. Assume that players will
get their hands on any item hidden by riddance in some other way than via the
creative inventory, such as `/give` or their friends. Instead of relying on
security by obscurity, take the proper measures such as privilege checks.

Riddance is not a complete solution for existing worlds. You will need other
mods to remove unknown nodes and unknown items that it might cause. Deleting
biomes will probably result in discontinuities between old and new map
generation.

Riddance has no mod load order issues, Riddance runs after all the mods are
loaded. Riddance can run for any game or mod in Minetest, not just specific ones
like Minetest Game, Mineclone or Ethereal.

## Configuring riddance

Riddance is configured with lists of things to rid and hide. You simply write a
list of the things, each separated by a comma, to rid/hide all of them in the
list. Spaces can optionally be used. For example to rid yourself of fire, flint
and steel, and TNT  in Minetest Game, you would configure `Ridding items` in the
menu (`riddance.rid_items` technical name) like so:

```fire:basic_flame,fire:flint_and_steel,tnt:tnt```

You can show itemstrings (technical names) for all inventory items by enabling
Settings -> Graphics and Audio -> User Interfaces -> GUIs -> Append item name,
which if done via minetest.conf would be the line

```tooltip_append_itemname = true```

## API

See the functions exported at the bottom of `init.lua`. There is no particular
benefit to using these if you already know what you are doing, barring some
future update like a riddance GUI.

## Licence

Riddance is licensed under the BSD 3-Clause License, see `LICENSE.txt` for details.
