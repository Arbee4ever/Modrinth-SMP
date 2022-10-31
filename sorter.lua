local input = peripheral.find("minecraft:barrel")

local misc = peripheral.find("minecraft:trapped_chest")
local chests = { peripheral.find("minecraft:chest") }

while true do
	os.pullEvent("redstone")
	if redstone.getInput("left") == true then
		for inputSlot, inputItem in pairs(input.list()) do
			for _, chest in pairs(chests) do
				for slot, item in pairs(chest.list()) do
					if inputItem.name == item.name then
						chest.pullItems(peripheral.getName(input), inputSlot)
						break
					end
				end
			end
			misc.pullItems(peripheral.getName(input), inputSlot)
		end
	end
end
