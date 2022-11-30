riddance = {}
local riddance = riddance

local function log(lvl, msg)
    minetest.log(lvl, "[riddance] " .. msg)
end

local function info(msg) log("info", msg) end
local function warn(msg) log("warning", msg) end

local function deregister_item(itemname)
    local def = minetest.registered_items[itemname]
    info(string.format("Ridding item: %s", itemname))
    if not def then
        warn(string.format("No such item to rid: " ..
            "'%s' (remember to use technical names)", itemname))
        return false
    end

    minetest.unregister_item(itemname)
    return true
end

local function hide_item(itemname)
    local def = minetest.registered_items[itemname]
    info(string.format("Hiding item: %s", itemname))
    if not def then
        warn(string.format("No such item to hide: " ..
            "%s (remember to use technical names)", itemname))
        return false
    end

    local grp = def.groups or {}
    grp.not_in_creative_inventory = 1
    minetest.override_item(itemname, grp)
    return true
end

local function unregister_biome(biomename)
    local def = minetest.registered_biomes[biomename]
    info(string.format("Ridding biome: %s", biomename))
    if not def then
        warn(string.format("No such biome to rid: " ..
                "%s (remember to use technical names)", biomename))
    end

    minetest.unregister_biome(biomename)
    return true
end

local function unregister_chatcommand(cmdname)
    local def = minetest.registered_chatcommands[cmdname]
    info(string.format("Ridding chat command: %s", cmdname))
    if not def then
        warn(string.format("No such chatcommand to rid: "
                .. "%s (remember to use technical names)", cmdname))
    end

    minetest.unregister_chatcommand(cmdname)
    return true

end

local function action_items(confstr, callback)
    local items = confstr:split("%s*,%s*", false, -1, true)
    for _, item in pairs(items) do
        callback(item)
    end
end

local function good_riddance()
    local settings = minetest.settings
    action_items(settings:get("riddance.rid_items") or "", deregister_item)
    action_items(settings:get("riddance.hide_items") or "", hide_item)
    action_items(settings:get("riddance.rid_biomes") or "", unregister_biome)
    action_items(settings:get("riddance.rid_chatcommands") or "", unregister_chatcommand)
end

minetest.register_on_mods_loaded(good_riddance)

riddance.deregister_item = deregister_item
riddance.hide_item = hide_item
riddance.unregister_biome = unregister_biome
riddance.unregister_chatcommand = unregister_chatcommand
