function onInit()
    CombatManager.setCustomAddBattle(addBattle);
end

function addBattle( nodeBattle )
    local aModulesToLoad = {};
    local sTargetNPCList = LibraryData.getCustomData("battle", "npclist") or "npclist";
    for _, vNPCItem in pairs(DB.getChildren(nodeBattle, sTargetNPCList)) do
        local sClass, sRecord = DB.getValue(vNPCItem, "link", "", "");
        if sRecord ~= "" then
            local nodeNPC = DB.findNode(sRecord);
            if not nodeNPC then
                local sModule = sRecord:match("@(.*)$");
                if sModule and sModule ~= "" and sModule ~= "*" then
                    if not StringManager.contains(aModulesToLoad, sModule) then
                        table.insert(aModulesToLoad, sModule);
                    end
                end
            end
        end
        for _,vPlacement in pairs(DB.getChildren(vNPCItem, "maplink")) do
            local sClass, sRecord = DB.getValue(vPlacement, "imageref", "", "");
            if sRecord ~= "" then
                local nodeImage = DB.findNode(sRecord);
                if not nodeImage then
                    local sModule = sRecord:match("@(.*)$");
                    if sModule and sModule ~= "" and sModule ~= "*" then
                        if not StringManager.contains(aModulesToLoad, sModule) then
                            table.insert(aModulesToLoad, sModule);
                        end
                    end
                end
            end
        end
    end

    if #aModulesToLoad > 0 then
        local wSelect = Interface.openWindow("module_dialog_missinglink", "");
        wSelect.initialize(aModulesToLoad, onBattleNPCLoadCallback, { nodeBattle = nodeBattle });
        return;
    end

    -- Override:
    -- This is local to CoreRPG combatmanager, so disable.
    -- if fCustomAddBattle then
    --    return fCustomAddBattle(nodeBattle);
    -- end
    --
    -- NPC flavor clearing whatever it needs clearing
    NPCFlavors.prepareForBattle()
    -- END Override

    -- Cycle through the NPC list, and add them to the tracker
    for _, vNPCItem in pairs(DB.getChildren(nodeBattle, sTargetNPCList)) do
        -- Get link database node
        local nodeNPC = nil;
        local sClass, sRecord = DB.getValue(vNPCItem, "link", "", "");
        if sRecord ~= "" then
            nodeNPC = DB.findNode(sRecord);
        end
        local sName = DB.getValue(vNPCItem, "name", "");

        if nodeNPC then
            local aPlacement = {};
            for _,vPlacement in pairs(DB.getChildren(vNPCItem, "maplink")) do
                local rPlacement = {};
                local _, sRecord = DB.getValue(vPlacement, "imageref", "", "");
                rPlacement.imagelink = sRecord;
                rPlacement.imagex = DB.getValue(vPlacement, "imagex", 0);
                rPlacement.imagey = DB.getValue(vPlacement, "imagey", 0);
                table.insert(aPlacement, rPlacement);
            end

            local nCount = DB.getValue(vNPCItem, "count", 0);
            for i = 1, nCount do

                -- Override:
                -- 1. Call CombatManager.addNPC instead of local method since we're in another scope now
                -- 2. Use NPCFlavor no rename the NPC
                -- local nodeEntry = addNPC(sClass, nodeNPC, sName);
                local nodeEntry = CombatManager.addNPC(sClass, nodeNPC, sName);
                if NPCFlavors.isEnabled() then
                    NPCFlavors.renameNPC( nodeEntry );
                end
                -- END Override

                if nodeEntry then
                    local sFaction = DB.getValue(vNPCItem, "faction", "");
                    if sFaction ~= "" then
                        DB.setValue(nodeEntry, "friendfoe", "string", sFaction);
                    end
                    local sToken = DB.getValue(vNPCItem, "token", "");
                    if sToken == "" or not Interface.isToken(sToken) then
                        local sLetter = StringManager.trim(sName):match("^([a-zA-Z])");
                        if sLetter then
                            sToken = "tokens/Medium/" .. sLetter:lower() .. ".png@Letter Tokens";
                        else
                            sToken = "tokens/Medium/z.png@Letter Tokens";
                        end
                    end
                    if sToken ~= "" then
                        DB.setValue(nodeEntry, "token", "token", sToken);

                        if aPlacement[i] and aPlacement[i].imagelink ~= "" then
                            TokenManager.setDragTokenUnits(DB.getValue(nodeEntry, "space"));
                            local tokenAdded = Token.addToken(aPlacement[i].imagelink, sToken, aPlacement[i].imagex, aPlacement[i].imagey);
                            TokenManager.endDragTokenWithUnits(nodeEntry);
                            if tokenAdded then
                                TokenManager.linkToken(nodeEntry, tokenAdded);
                            end
                        end
                    end
                else
                    ChatManager.SystemMessage(Interface.getString("ct_error_addnpcfail") .. " (" .. sName .. ")");
                end
            end
        else
            ChatManager.SystemMessage(Interface.getString("ct_error_addnpcfail2") .. " (" .. sName .. ")");
        end
    end

    Interface.openWindow("combattracker_host", "combattracker");
end