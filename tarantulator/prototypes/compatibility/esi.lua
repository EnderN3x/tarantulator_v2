---- This file provides compatibility with the "Exotic Space Industries" (ESI) mod.
---- It ensures that the Tarantulator can utilize the custom fuel categories provided by ESI.
--
---- Retrieve the Tarantulator spider-vehicle prototype.
--local spider = data.raw["spider-vehicle"]["tarantulator"]
--
---- Check if the Tarantulator and its burner component exist.
--if spider and spider.burner then
--    -- Define the list of ESI's custom fuel categories.
--    local esi_categories = {
--        "ei-nuclear-fuel", 
--        "ei-nuclear-fuel-cell", 
--        "ei-fusion-fuel"
--    }
--
--    -- Ensure the fuel_categories table exists, defaulting to "nuclear" if it doesn't.
--    spider.burner.fuel_categories = spider.burner.fuel_categories or {"nuclear"}
--
--    -- Iterate through the ESI fuel categories and add them if they are not already present.
--    for _, new_cat in ipairs(esi_categories) do
--        local found = false
--        -- Check if the category already exists for the Tarantulator's burner.
--        for _, existing_cat in ipairs(spider.burner.fuel_categories) do
--            if existing_cat == new_cat then
--                found = true
--                break
--            end
--        end
--        
--        -- If the category was not found, add it to the list of compatible fuels.
--        if not found then
--            table.insert(spider.burner.fuel_categories, new_cat)
--        end
--    end
--end

-- prototypes/compatibility/esi.lua

local spider = data.raw["spider-vehicle"]["tarantulator"]

if spider then
    -- If ESI wiped the burner or changed it, re-declare the essentials
    if not spider.energy_source then
        spider.energy_source = {
            type = "burner",
            fuel_inventory_size = 2,
            burnt_inventory_size = 1,
            effectivity = 0.5,
            fuel_categories = {"nuclear"}
        }
    end

    -- Explicitly set the table to include ESI categories
    spider.energy_source.fuel_categories = {
        "nuclear",
        "ei-nuclear-fuel",
        "ei-nuclear-fuel-cell",
        "ei-fusion-fuel"
    }
    
    -- Debugging: Uncomment the line below to see a message in the logs (factorio-current.log) 
    -- to confirm this script actually ran.
    -- log("Tarantulator: Successfully injected ESI fuel categories.")
end